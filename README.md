# Quick Charge Persist Module for crDroid (POCO X3 NFC)

This Magisk module enables persistent Quick Charge support on custom ROMs like crDroid for the **POCO X3 NFC (Surya)**.

> ⚠️ **Tested ONLY on POCO X3 NFC (Surya).** Use on other devices at your own risk.

---

## ❓ Why this module?

Some AOSP-based custom ROMs such as **crDroid** lack the correct persistent system property that enables quick charging, even if the kernel and hardware support it.

In this case, **`persist.vendor.quick.charge=1`** was present in the **MIUI stock ROM**, but missing from crDroid.

This module restores that property.

---

## 🔍 How it was discovered

We did the following:

1. Extracted the `build.prop` from the original **MIUI stock ROM** using TWRP and ADB.
2. Searched for all relevant entries with `charge`, `usb`, `power`, `battery`, etc.
3. Found:

   ```ini
   persist.vendor.quick.charge=1
   ```
4. Ran `getprop` on the running crDroid system and confirmed the key was missing.
5. Temporarily injected it via:

   ```sh
   su
   resetprop persist.vendor.quick.charge 1
   ```
6. Observed that quick charging stayed enabled permanently until reboot.
7. Packaged the fix as a Magisk module.

---

## ⚙️ What this module does

* Adds a post-boot script via `post-fs-data.sh`.
* The script runs `resetprop` to force this:

  ```sh
  persist.vendor.quick.charge=1
  ```
* It logs its activity to:

  ```
  /data/adb/modules/quickcharge_persist/quickcharge.log
  ```

---

## 📦 Installation

1. Open **Magisk Manager**.
2. Go to **Modules > Install from Storage**.
3. Select the `quickcharge_magisk_module.zip`.
4. Reboot.
5. Run:

   ```sh
   getprop persist.vendor.quick.charge
   ```

   You should see:

   ```
   1
   ```

---

## ✅ Requirements

* **Rooted device** with **Magisk**.
* **POCO X3 NFC (surya)**.
* **crDroid** or any AOSP ROM **without the quick charge persist prop**.

---

## ⚠️ Disclaimer

* This module **only sets a system property**.
* It does **not modify kernel** or device tree.
* It is **safe** for supported devices, but not guaranteed to work on others.

---

## 📄 License

MIT License.

---

## 🤝 Contributions

Pull requests are welcome. If you have tested it on other Snapdragon 7xx devices or crDroid ports, please submit your test results or device support notes.
