$ThisPath = $PSScriptRoot

# Get-Childitem -Recurse | Select-Object PSParentPath,Extension -Unique # to get list of files in the directory to decide which you want to convert

$data = Get-ChildItem "$ThisPath\*" -Include *.HEIC, *.JPG, *.PNG, *.MOV, *.plist, *.mov, *.jpg, *.mp4, *.heic 
$data | ForEach-Object {
    

    #get the extension
    $ext = $_.Extension
    #get the last write time
    $LastWriteTime = $_.LastWriteTime
    #getting the type stored by the iPhone (after the '~')
    $type = ""
    if($_.Name.Contains("~")){
        $pos1 = $_.Name.IndexOf("~")
        $type = $_.Name.Substring($pos1)
        $pos2 = $type.IndexOf(".")
        $type = $type.Substring(0,$pos2)
    }
    
    
    #if create date > last modified date change create date to last modified date
    if($_.CreationTime -gt $_.LastWriteTime){
        $_.CreationTime = $_.LastWriteTime
    }

    #converting to a string ordered descendingly for easy sorting in file explorer
    $LastWriteTime = $LastWriteTime.ToString("yyyy-MM-dd_hh\hmm\mss\s")

    #rename to last modified date and convert to png if heic
    $newExt = $ext
    if($newExt.ToLower() -eq ".heic"){
        $newExt = ".png"
        New-Item -ItemType File -Path "./HeicBackups/$LastWriteTime$type$ext" -Force
        Copy-Item $_.Name -Path "./HeicBackups/$LastWriteTime$type$ext" -Force #backup the original just in case
    }
    
    $_ | Rename-Item -NewName {
        $newName = "$LastWriteTime$type$newExt"
        for($i = 1; Test-Path $newName; ++$i) {
            $newName = "$LastWriteTime$type"+ "_" + $i + $newExt
        }
        $newName
    }
}
