# finnget.psd1

@{
    ModuleVersion = '1.4'
    Author = 'Aleksandre Nozadze(FinnTheHero)'
    Description = 'FinnGet is a Windows Powershell system information display tool'
    GUID = '80b592e9-fbe7-4a3a-b150-60da65afd483'

    NestedModules = @('Logo.psm1', 'GetInfo.psm1')
    FileList = @('finnget.psm1', 'Logo.psm1', 'GetInfo.psm1')
    RootModule = 'finnget.psm1'
}