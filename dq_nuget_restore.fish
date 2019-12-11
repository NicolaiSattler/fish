function dq_nuget_restore

    set currentFolder $PWD
    set rootdq '/mnt/c/DataQuint'
    set -l repositories 'dataquint-system-security/DataQuint.System.Security/DataQuint.System.Security.sln' 'dataquint-framework/DataQuint.Framework/DataQuint.Framework.sln' 'dataquint-data-generic-data-provider/DataQuint.Data.Gdp/DataQuint.Data.Gdp.sln' 'dataquint-data-workbench/DataQuint.Data.Workbench.Desktop.All.sln' 'dataquint-reports-connections/DataQuint.Reports.Connections.sln' 'geovisia-framework/GeoVisia.Framework.sln' 'geovisia-analytics/GeoVisia.Analytics.Components/GeoVisia.Analytics.Components.sln' 'geovisia-analytics/GeoVisia.Analytics.Online/GeoVisia.Analytics.Online.sln' 'geovisia-analytics/GeoVisia.Analytics.Online.Application/GeoVisia.Analytics.Online.Application.sln' 'geovisia-analytics/GeoVisia.Analytics.Online.Components/GeoVisia.Analytics.Online.Components.sln' 'geovisia-online/GeoVisia.Online.All.sln'  'geovisia-online/GeoVisia.Online.Application/GeoVisia.Online.Application.sln' 'geovisia-online-components/GeoVisia.Online.Components.sln' 'geovisia-online-components-openlayers/GeoVisia.Online.Components.OpenLayers.sln' 'geovisia-online-admin/GeoVisia.Online.Admin.sln' 'geovisia-desktop/GeoVisia.Desktop.All.sln' 'geovisia-addon-cyclomedia/GeoVisia.Online.Addons.StreetSmart/GeoVisia.Online.Addons.StreetSmart.sln'  'geovisia-addon-maatregeltoets/GeoVisia.Addon.Maatregeltoets.sln' 'geovisia-addon-schouwen/GeoVisia.Online.Addon.sln' 'geovisia-addon-rioleringbeheer/GeoVisia.Addons.RioleringBeheer.sln' 'geovisia-addon-data-workbench/GeoVisia.Addon.Data.Workbench.sln' 'geovisia-projectmanager/GeoVisia.Projectmanager.sln' 'geovisia-woordenboek-updater/GeoVisia.Desktop.WoordenboekUpdater.sln'
    
    cd $rootdq
    
    for repo in $repositories
        echo "$repo"
        
        nuget restore "$repo"
    end

    cd $currentFolder

end