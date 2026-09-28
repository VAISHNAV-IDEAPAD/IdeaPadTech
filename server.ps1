param([int]$Port = 3000)

$root = "C:\Users\Tilak\.gemini\antigravity\scratch\ideapadtech"
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$Port/")
try {
    $listener.Start()
    Write-Output "IdeaPadTech Server running at http://localhost:$Port/"
    
    while ($listener.IsListening) {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response

        $path = $request.Url.LocalPath.TrimStart('/')
        if ([string]::IsNullOrEmpty($path)) { $path = "index.html" }
        
        $filePath = Join-Path $root $path
        
        if (Test-Path $filePath -PathType Leaf) {
            $ext = [System.IO.Path]::GetExtension($filePath).ToLower()
            $mime = switch ($ext) {
                ".html" { "text/html; charset=utf-8" }
                ".css"  { "text/css" }
                ".js"   { "application/javascript" }
                ".apk"  { "application/vnd.android.package-archive" }
                ".json" { "application/json" }
                ".png"  { "image/png" }
                ".svg"  { "image/svg+xml" }
                Default { "application/octet-stream" }
            }
            $response.ContentType = $mime
            
            if ($ext -eq ".apk") {
                $response.AddHeader("Content-Disposition", "attachment; filename=`"OmniBoot-v1.0.apk`"")
            }
            
            $bytes = [System.IO.File]::ReadAllBytes($filePath)
            $response.ContentLength64 = $bytes.Length
            $response.OutputStream.Write($bytes, 0, $bytes.Length)
        } else {
            $response.StatusCode = 404
            $err = [System.Text.Encoding]::UTF8.GetBytes("404 Not Found")
            $response.OutputStream.Write($err, 0, $err.Length)
        }
        $response.Close()
    }
} finally {
    $listener.Stop()
}
