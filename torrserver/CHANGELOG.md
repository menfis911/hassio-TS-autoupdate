# Changelog

## MatriX.145.2 — 2026-10-04

**TorrServer:** `MatriX.145.2`  
**Upstream release:** MatriX.145.2

### Release notes from upstream

## What's Changed
* fix(ssl): never replace user-supplied certs, tighten generated key perms by @lieranderl in https://github.com/YouROK/TorrServer/pull/884
* fix: find Entware root CA certificates for outgoing HTTPS by @lieranderl in https://github.com/YouROK/TorrServer/pull/890
* test(rutor): skip parse tests when rutor.ls is missing by @lieranderl in https://github.com/YouROK/TorrServer/pull/893
* test(trackers): fix data race in refresh tests by @lieranderl in https://github.com/YouROK/TorrServer/pull/894
* feat(ssl): cert hot reload, managed servers, strict --force-https, --http-media, --https-only by @lieranderl in https://github.com/YouROK/TorrServer/pull/885
* fix(torr): stop the nil dereference when settings reconnect the client by @ManSio in https://github.com/YouROK/TorrServer/pull/896

## New Contributors
* @ManSio made their first contribution in https://github.com/YouROK/TorrServer/pull/896

**Full Changelog**: https://github.com/YouROK/TorrServer/compare/MatriX.145.1...MatriX.145.2
