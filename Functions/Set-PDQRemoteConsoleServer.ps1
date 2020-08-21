function Set-PDQRemoteConsoleServer {
    <#
        .SYNOPSIS
            Sets the Remote Console Server for PDQ Deploy/Inventory
        .DESCRIPTION
            Shows Current Config for PDQ Deploy and Inventory Consoles, and then sets it to what was specified and shows the change
        .PARAMETER ServerHostName
            Server to point PDQ Deploy/Inventory at
        .EXAMPLE
            Set-PDQRemoteConsoleServer -ServerHostName Test1.test.com
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]$ServerHostName
    ) 
    BEGIN { 
        $CurrentConfig = Get-PDQRemoteConsoleServer
    } #BEGIN

    PROCESS {
        Set-ItemProperty 'HKLM:\SOFTWARE\Admin Arsenal\PDQ Deploy\Protocol\' -Name ServerHostName -Value $ServerHostName
        Set-ItemProperty 'HKLM:\SOFTWARE\Admin Arsenal\PDQ Inventory\Protocol\' -Name ServerHostName -Value $ServerHostName

        $UpdatedConfig = Get-PDQRemoteConsoleServer
    } #PROCESS

    END { 
        Write-Host 'Current Config'
        $CurrentConfig | Format-List

        Write-Host 'Updated Config'
        $UpdatedConfig | Format-List
    } #END

} #FUNCTION