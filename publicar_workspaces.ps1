# Precisa instalar o módulo de comandos
# Install-Module -Name MicrosoftPowerBIMgmt
# https://docs.microsoft.com/en-us/powershell/power-bi/overview?view=powerbi-ps

# Conecta na conta do Power BI
Connect-PowerBIServiceAccount

# Pega todos os aquivos *.pbix da pasta que desejar
$files = Get-ChildItem -Path "caminho_da_pasta_dos_arquivos\*" -Include *.pbix

# Faz a iteração em cada arquivo
foreach ($f in $files) {
    $outfile = $f.FullName
    Write-Output ($f.Name + " -> iniciando pub.")
    # Comando para publicar o relatório no workspace
    New-PowerBIReport -Path $outfile -Name $outfile -ConflictAction CreateOrOverwrite -Workspace ( Get-PowerBIWorkspace -Name 'nome_do_workspace' )
    Write-Output ($f.Name + " -> Pub. com sucesso.")
}

Write-Output "-------------------------------------" "Processo de pub. finalizado."