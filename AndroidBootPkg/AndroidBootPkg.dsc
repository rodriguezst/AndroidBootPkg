[Defines]
  PLATFORM_NAME                  = AndroidBootPkg
  PLATFORM_GUID                  = 1e9e7e8c-5e23-4f38-85d9-7856aa075d11
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION             = 0x00010005
  OUTPUT_DIRECTORY              = Build/AndroidBootPkg
  SUPPORTED_ARCHITECTURES       = X64|IA32|AARCH64
  BUILD_TARGETS                 = DEBUG|RELEASE
  SKUID_IDENTIFIER              = DEFAULT

[LibraryClasses]
  UefiApplicationEntryPoint|MdePkg/Library/UefiApplicationEntryPoint/UefiApplicationEntryPoint.inf
  UefiLib|MdePkg/Library/UefiLib/UefiLib.inf
  UefiBootServicesTableLib|MdePkg/Library/UefiBootServicesTableLib/UefiBootServicesTableLib.inf
  UefiRuntimeServicesTableLib|MdePkg/Library/UefiRuntimeServicesTableLib/UefiRuntimeServicesTableLib.inf
  BaseLib|MdePkg/Library/BaseLib/BaseLib.inf
  BaseMemoryLib|MdePkg/Library/BaseMemoryLib/BaseMemoryLib.inf
  DebugLib|MdePkg/Library/BaseDebugLibNull/BaseDebugLibNull.inf
  PrintLib|MdePkg/Library/BasePrintLib/BasePrintLib.inf
  PcdLib|MdePkg/Library/BasePcdLibNull/BasePcdLibNull.inf
  MemoryAllocationLib|MdePkg/Library/UefiMemoryAllocationLib/UefiMemoryAllocationLib.inf
  DevicePathLib|MdePkg/Library/UefiDevicePathLib/UefiDevicePathLib.inf

[Components]
  AndroidBootPkg/Application/C0DEADDED/C0DEADDED.inf
