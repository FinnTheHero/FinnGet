# finnget.psd1

@{
    ModuleVersion = '1.2'
    Author = 'Aleksandre Nozadze(FinnTheHero)'
    Description = 'FinnGet is a Windows Powershell system information display tool'

    NestedModules = @('Logo.psm1', 'GetInfo.psm1')
    FileList = @('finnget.psm1', 'Logo.psm1', 'GetInfo.psm1')
    RootModule = 'finnget.psm1'
}