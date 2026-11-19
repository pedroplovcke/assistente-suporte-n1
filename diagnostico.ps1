Write-Host "=== ASSISTENTE DE SUPORTE N1 ==="
Write-Host "1 - Testar conexao com a internet (Ping)"
Write-Host "2 - Ver configuracoes de rede (IP e DNS)"
Write-Host "3 - Ver informacoes do sistema e memoria"
Write-Host "4 - Rodar diagnostico completo e salvar relatorio"

$opcao = Read-Host "Escolha uma opcao"

if ($opcao -eq "1") {
    ping 8.8.8.8
}
elseif ($opcao -eq "2") {
    ipconfig /all
}
elseif ($opcao -eq "3") {
    systeminfo
}
elseif ($opcao -eq "4") {
    Write-Host "Gerando relatorio..."
    ping 8.8.8.8 > relatorio.txt
    ipconfig /all >> relatorio.txt
    systeminfo >> relatorio.txt
    Write-Host "Pronto! Salvo em relatorio.txt"
}
else {
    Write-Host "Opcao invalida"
}