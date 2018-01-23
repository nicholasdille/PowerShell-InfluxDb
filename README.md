| AppVeyor | Coveralls | Download |
| :------: | :-------: | :------: |
| [![Build status](https://ci.appveyor.com/api/projects/status/8s64y46nck7qd5ty?svg=true)](https://ci.appveyor.com/project/nicholasdille/powershell-influxdb) | [![Coverage Status](https://coveralls.io/repos/github/nicholasdille/PowerShell-InfluxDb/badge.svg?branch=master)](https://coveralls.io/github/nicholasdille/PowerShell-InfluxDb?branch=master) | [![Download](https://img.shields.io/badge/powershellgallery-InfluxDb-blue.svg)](https://www.powershellgallery.com/packages/InfluxDb/) 

# Introduction

Cmdlets for [InfluxDb](https://www.influxdata.com/time-series-platform/influxdb/)

## Usage

Please install the dependencies:

```powershell
Install-Module -Name Helpers,WebRequest,InfluxDb -AllowClobber
```

Then load the modules and configure credentials:

```powershell
Import-Module -Name Helpers,WebRequest,InfluxDb
Set-RancherServer -Server your_server_here.com -AccessKey your_access_key_here -SecretKey your_secret_key_here
Set-InfluxDbServer -Server your_server_here.com -User your_user_here -Token your_secret_here
```

And then - finally - start executing cmdlets:

```powershell
Get-Command -Module InfluxDb
```
