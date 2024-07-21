$folderPath = "."

function Remove-ZhHansFiles {
    param (
        [string]$path
    )
    
    $files = Get-ChildItem -Path $path -File
    foreach ($file in $files) {
        if ($file.Name -like '*zh-hans*') {
            Remove-Item -Path $file.FullName -Force
        }
    }

    $directories = Get-ChildItem -Path $path -Directory
    foreach ($directory in $directories) {
        Remove-ZhHansFiles -path $directory.FullName
    }
}
Remove-ZhHansFiles -path $folderPath