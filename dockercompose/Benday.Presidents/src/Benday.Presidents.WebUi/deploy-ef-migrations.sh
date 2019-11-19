#!/bin/bash

EfMigrationsNamespace=$1
DataContextClassName=$2
EfMigrationsDllName=$1.dll
EfMigrationsDllDepsJson=$1.deps.json
EfMigrationsDllRuntimeConfigJson=$1.runtimeconfig.json
DllDir=$PWD
PathToNuGetPackages=~/.nuget/packages
PathToEfDll=./ef.dll

echo *****
echo ***** EF CORE DATABASE MIGRATIONS DEPLOYING FOR $DataContextClassName *****
echo *****

dotnet exec --depsfile ./$EfMigrationsDllDepsJson --additionalprobingpath $PathToNuGetPackages --runtimeconfig $EfMigrationsDllRuntimeConfigJson $PathToEfDll database update --assembly ./$EfMigrationsDllName --startup-assembly ./$EfMigrationsDllName --project-dir . --content-root $DllDir --data-dir $DllDir --verbose --root-namespace $EfMigrationsNamespace --context $DataContextClassName

echo *****
echo ***** ...EF CORE DATABASE MIGRATIONS DEPLOYED FOR $DataContextClassName *****
echo *****
