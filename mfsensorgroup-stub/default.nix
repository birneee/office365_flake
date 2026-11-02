# Stub mfsensorgroup.dll (see mfsensorgroup.c), which Wine lacks and PowerPoint delay-loads.
{ stdenvNoCC, zig }:
stdenvNoCC.mkDerivation {
  pname = "mfsensorgroup-stub";
  version = "0.1";
  src = ./.;
  nativeBuildInputs = [ zig ];
  dontConfigure = true;
  buildPhase = ''
    runHook preBuild
    export ZIG_GLOBAL_CACHE_DIR=$TMPDIR/zig-cache
    export ZIG_LOCAL_CACHE_DIR=$TMPDIR/zig-local
    zig cc -target x86_64-windows-gnu -shared -O2 -Wall -o mfsensorgroup.dll mfsensorgroup.c
    runHook postBuild
  '';
  installPhase = ''
    runHook preInstall
    install -Dm644 mfsensorgroup.dll $out/lib/wine/x86_64-windows/mfsensorgroup.dll
    runHook postInstall
  '';
}
