/*
 * mfsensorgroup.dll: Media Foundation's camera sensor-group library, which Wine does not have.
 *
 * PowerPoint (PPCORE.DLL) delay-loads it for MFCreateSensorActivityMonitor, which tells it when a
 * camera is in use (Cameo). A delay-load of a missing DLL raises 0xc06d007e and takes PowerPoint
 * down a few seconds after a presentation opens. No camera monitoring under Wine: report it as
 * unsupported, which Windows also does on systems without the sensor stack.
 */
#include <windows.h>

__declspec(dllexport) HRESULT WINAPI MFCreateSensorActivityMonitor(void *callback, void **monitor)
{
    (void)callback;
    if (monitor) *monitor = NULL;
    return E_NOTIMPL;
}
