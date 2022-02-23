FROM mcr.microsoft.com/windows/servercore/iis

SHELL ["powershell"]

RUN Install-WindowsFeature NET-Framework-45-ASPNET ; \
    Install-WindowsFeature Web-Asp-Net45

COPY test test
RUN Remove-WebSite -Name 'Default Web Site'
RUN New-Website -Name 'test' -Port 8090 \
    -PhysicalPath 'c:\test' -ApplicationPool '.NET v4.5'
EXPOSE 8090

CMD ["ping", "-t", "localhost"]
