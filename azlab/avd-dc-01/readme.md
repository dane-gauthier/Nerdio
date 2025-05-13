# Nerdio Lab

This folder includes PowerShell scripts to change the power state and sizing of a domain controller VM.

## Scripts

### `dc-scale-down.ps1`
Scales **down** the DC VM to a smaller size.

- **Checks current size** and does nothing if already scaled.
- **Stops the VM** (if it's running).
- **Changes the VM size** to  **Standard_DS1_v2**.
- **Starts** the VM.

---

### `dc-scale-up.ps1`
Scales **up** the DC VM to a larger size.

- **Checks current size** and does nothing if already scaled.
- **Stops the VM** if it's running.
- **Changes the VM size** to  **Standard_DS3_v2**.
- **Starts** the VM.

---

### `dc-start.ps1`
Starts the DC VM if it's deallocated.

- Checks the current power state.
- Starts the VM if it is not already running.

---

### `dc-stop.ps1`
Stops (deallocates) the DC VM if it's running.

- Checks the current power state.
- Stops the VM if it is running.

## Usage

Each script run individually:

```powershell
.\dc-scale-up.ps1
.\dc-scale-down.ps1
.\dc-start.ps1
.\dc-stop.ps1
