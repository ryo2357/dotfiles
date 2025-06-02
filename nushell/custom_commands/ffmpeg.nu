# export def convert_iso [] {
#   glob *.iso | each {|f|
#     let stem = ($f | path basename | str replace '.iso' '')
#     let output = (ffmpeg -i $f $"($stem).mp4" | complete)

#     if $output.exit_code == 0 {
#       print $"✅ Converted ($f) to ($stem).mp4"
#     } else {
#       print $"❌ Failed to convert ($f): ($output.stderr)"
#     }
#   }
# }

# export def convert_iso [] {
#   glob *.iso | each {|f|
#     let stem = ($f | path basename | str replace '.iso' '')
    
#     # ストリーム情報を取得
#     let streams = ( ^ffprobe -v error -show_streams -of json $f | from json ).streams

#     # 映像ストリームのインデックス取得
#     let video_index = (
#       $streams
#       | where {|s| $s.codec_type == "video" and $s.codec_type != "none" }
#       | get 0.index
#     )

#     # 音声ストリームのインデックス取得（channels > 0）

#     let audio_index = (
#       $streams
#       | where codec_type == "audio"
#       | filter {|s| $s.codec_type == "ac3" } 
#       | get 0.index
#       | default (
#           $streams
#           | where codec_type == "audio" and channels > 0
#           | get 0.index
#         )
#     )

#     # 出力ファイル名
#     let output = $"($stem).mp4"

#     # try ブロックで ffmpeg の実行結果をハンドリング
#     try {
#       ^ffmpeg [
#         "-i", $f
#         "-map", $"0:($video_index)"
#         "-map", $"0:($audio_index)"
#         "-c:v", "libx264"
#         "-crf", "23"
#         "-preset", "medium"
#         "-c:a", "aac"
#         "-b:a", "192k"
#         $output
#       ]
#       print $"✅ Converted ($f) to ($output)"
#     } catch {
#       print $"❌ Failed to convert ($f)"
#     }
#   }
# }

export def convert_iso [] {
  # let files = glob *.iso
  let files = (glob *.iso)
  # print iso files: ($files)

  if ($files | is-empty) {
    print "❌ No .iso files found."
    return
  }

  $files | each {|f| iso_to_mp4 $f }

}

export def iso_to_mp4 [filename] {
  let stem = ($filename | path basename | str replace '.iso' '')
  
  # ストリーム情報を取得
  let streams = ( ^ffprobe -v error -show_streams -of json $filename | from json ).streams

  # codec_name が空でない行のみを残す
  let streams = (
      $streams
      | where {|s| not ($s | get codec_name? | is-empty) }
  )
  # 映像ストリームのインデックス取得
  let video_index = (
    $streams
    | where {|s| $s.codec_type == "video" } 
    | get 0.index
  )

  # 音声ストリームのインデックス取得
    let audio_index = (
      $streams
      | where codec_type == "audio"
      | filter {|s| $s.codec_name == "ac3" } 
      | get 0.index?
      | default (
          $streams
          | where codec_type == "audio" and channels > 0
          | get 0.index
        )
    )

  # 出力ファイル名
  let output = $"($stem).mp4"

  print $"video_index: ($video_index), audio_index: ($audio_index)"

  # try ブロックで ffmpeg の実行結果をハンドリング
  try {
    ^ffmpeg [
      "-i", $filename
      "-map", $"0:($video_index)"
      "-map", $"0:($audio_index)"
      "-c:v", "libx264"
      "-crf", "23"
      "-preset", "medium"
      "-c:a", "aac"
      "-b:a", "192k"
      $output
    ]
    print $"✅ Converted ($filename) to ($output)"
  } catch {
    print $"❌ Failed to convert ($filename)"
  }
}