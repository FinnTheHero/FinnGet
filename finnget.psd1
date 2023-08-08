# finnget.psd1

@{
    ModuleVersion = '1.1'
    Author = 'Aleksandre Nozadze(FinnTheHero)'
    Description = 'FinnGet is a Windows PowerShell script that provides system information'

    NestedModules = @('Logo.psm1', 'GetInfo.psm1')
    FileList = @('finnget.psm1', 'Logo.psm1', 'GetInfo.psm1')
    RootModule = 'finnget.psm1'
}