$ErrorActionPreference = "Stop"
if ($args.Count -ne 2) {
    Write-Host "Usage: script.ps1 <URL> <Output_Name>"
    exit 1
}

$URL = $args[0]
$OUTPUT_NAME = $args[1]
$TAR_FILE = "downloaded_file.tar"

Invoke-WebRequest -Uri $URL -OutFile $TAR_FILE
New-Item -ItemType Directory -Path $OUTPUT_NAME -Force
& tar -xf $TAR_FILE -C $OUTPUT_NAME
Compress-Archive -Path "$OUTPUT_NAME/*" -DestinationPath "$OUTPUT_NAME.zip"
Remove-Item -Recurse -Force $TAR_FILE, $OUTPUT_NAME
Write-Host "Archive successfully created: $OUTPUT_NAME.zip"