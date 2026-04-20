$sha = gh api repos/backommi/the-fourth-agent/contents/index.html -q ".sha"
$content = Get-Content "C:\Users\Administrator\.openclaw\workspace-dreamweaver\novel-site\index.html" -Raw
$bytes = [Text.Encoding]::UTF8.GetBytes($content)
$encoded = [Convert]::ToBase64String($bytes)
gh api --method PUT repos/backommi/the-fourth-agent/contents/index.html -f message="Update index with chapter card links" -f content=$encoded -f sha=$sha -f branch=main
Write-Host "Index updated successfully!"