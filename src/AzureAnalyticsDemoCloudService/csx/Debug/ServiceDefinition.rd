﻿<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="AzureAnalyticsDemoCloudService" generation="1" functional="0" release="0" Id="dc4e894e-135e-4462-890a-5d481a6af00e" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="AzureAnalyticsDemoCloudServiceGroup" generation="1" functional="0" release="0">
      <settings>
        <aCS name="AzureAnalyticsDemo.WorkerRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/AzureAnalyticsDemoCloudService/AzureAnalyticsDemoCloudServiceGroup/MapAzureAnalyticsDemo.WorkerRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="AzureAnalyticsDemo.WorkerRoleInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/AzureAnalyticsDemoCloudService/AzureAnalyticsDemoCloudServiceGroup/MapAzureAnalyticsDemo.WorkerRoleInstances" />
          </maps>
        </aCS>
      </settings>
      <maps>
        <map name="MapAzureAnalyticsDemo.WorkerRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/AzureAnalyticsDemoCloudService/AzureAnalyticsDemoCloudServiceGroup/AzureAnalyticsDemo.WorkerRole/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapAzureAnalyticsDemo.WorkerRoleInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/AzureAnalyticsDemoCloudService/AzureAnalyticsDemoCloudServiceGroup/AzureAnalyticsDemo.WorkerRoleInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="AzureAnalyticsDemo.WorkerRole" generation="1" functional="0" release="0" software="E:\git\RB\AzureAnalyticsDemo\src\AzureAnalyticsDemoCloudService\csx\Debug\roles\AzureAnalyticsDemo.WorkerRole" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaWorkerHost.exe " memIndex="-1" hostingEnvironment="consoleroleadmin" hostingEnvironmentVersion="2">
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;AzureAnalyticsDemo.WorkerRole&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;AzureAnalyticsDemo.WorkerRole&quot; /&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/AzureAnalyticsDemoCloudService/AzureAnalyticsDemoCloudServiceGroup/AzureAnalyticsDemo.WorkerRoleInstances" />
            <sCSPolicyUpdateDomainMoniker name="/AzureAnalyticsDemoCloudService/AzureAnalyticsDemoCloudServiceGroup/AzureAnalyticsDemo.WorkerRoleUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/AzureAnalyticsDemoCloudService/AzureAnalyticsDemoCloudServiceGroup/AzureAnalyticsDemo.WorkerRoleFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="AzureAnalyticsDemo.WorkerRoleUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="AzureAnalyticsDemo.WorkerRoleFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="AzureAnalyticsDemo.WorkerRoleInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
</serviceModel>