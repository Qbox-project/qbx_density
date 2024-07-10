# qbx_density
Population management for qbox.

## Features
- Calm AI (adjusting npc/gang npc aggresiveness)
- Adjusting npc/vehicle/parked vehicle spawn rates
- Small collection of ymaps to disable car generators

## Installation
### Manual
- Download the script and put it in the `[qbx]` directory.
- Add the following code to your server.cfg/resouces.cfg
```
ensure qbx_density
```

## Configuration
- Adjust variables in `config/client.lua` for permanent changes
- Utilize `exports.qbx_density:SetDensity(type, value)` to adjust at runtime