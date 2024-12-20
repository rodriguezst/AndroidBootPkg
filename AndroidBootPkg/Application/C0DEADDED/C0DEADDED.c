/** @file
  Android Boot State manipulation tool

  Copyright (c) 2024 rodriguezst (https://github.com/rodriguezst)

  SPDX-License-Identifier: MIT
**/

#include <Uefi.h>
#include <Library/UefiLib.h>
#include <Library/UefiBootServicesTableLib.h>
#include <Library/UefiRuntimeServicesTableLib.h>

/**
  The user Entry Point for the application.

  @param[in] ImageHandle    The firmware allocated handle for the EFI image.
  @param[in] SystemTable    A pointer to the EFI System Table.

  @retval EFI_SUCCESS       The entry point executed successfully.
  @retval other            Some error occurred.
**/
EFI_STATUS
EFIAPI
UefiMain (
  IN EFI_HANDLE        ImageHandle,
  IN EFI_SYSTEM_TABLE  *SystemTable
  )
{
  // Write the magic keyword at 0x17FE00000 address
  *(volatile UINT64*)0x17FE00000 = 0xC0DEADDED;

  // Stall for 0.5 seconds
  gBS->Stall(500000);

  // Perform a warm reset
  gRT->ResetSystem(
    EfiResetWarm,
    EFI_SUCCESS,
    0,
    NULL
    );

  return EFI_SUCCESS;
}
