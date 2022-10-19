# Practical Forensic-Response tools for Windows

The forensic applied to computers (informatics) references any kind of scientific and research method that can use for digital evidence that sustain, process, transmit, and store digital information. It can be applied to a Hard drive, emails, firewalls, cloud instances, laptops, desktops, smartphones, and so on.

This whole process can be summarized in 4 big steps

1. Collecting the **custody chain**, which simply refers to the non-manipulated evidence.

2. After the collection, we go to a **detailed documentation** process which is all the process that the evidence goes through in order to get how can be treated and what can we conclude about it.

3. Then, we need to perform **evidence conservation**, by generating legit copies or duplicates to the collected evidence.

4. To a final **containerization** of the evidence and the standards that are required for to custody, processing, and concentration of digital data.

When using digital evidence from devices, we need to think about the environment as a whole, if our study case is a laptop, it's required to evaluate other assets such as phones, modems, routers, or whatever element found in that space. In a few words, the environment information SHOULD be collected as well, it can lead to more evidence.

The process of applying forensics is extremely fragile. There's a lot of methods, procedures, mistakes that can destroy the evidence, they are considered anti-forensics methods. In terms of computers can be from hiding something, deleting files to more complex scenarios like filesystem modifications, encryptions, or deleting system registries.

As an example, if you delete a file from a hard drive, you are basically deleting the record from the index table, however, the original information still on the disk, until at some point is overwritten partially or completely.

## Custody chain

This is the first procedure for a forensic process. The idea behind this is to identify, secure, document, and generate the custody chain itself.

Let's start with the **laptop** example

For the identification phase, you should take a photo from the scene first. 

There are some conditions when securing the evidence: if the device is powered, then you should extract volatile information such as RAM, temp files, and related, then, generate a disk image from the current status and shut down the device. If the device is unpowered, you need to unplug the power supply and battery, document each type of connection and cable present, for a later disk image copy generation.

However, others techniques can be applied in certain scenarios. The **post-mortem analysis** is applied to unpowered devices, and basically, the whole idea of this is to try to recover storage data, even volatile information specifically from the memory states, also there's the **e-discovery technique** and is used to a massive memory data acquisition, ideally for incidents in big infrastructures with the goal of finding relevant data.

The counterpart of the **post-mortem analysis** happens with a powered device, this is a typical analysis for security data breaches. This is great for memory data acquisition but the big main risk is to dump temp files and the memory itself. 

All the devices should be stored in specific forensic packaging.

The data has different volatile times, it will always depend on time, the more time has passed, the less data disponibility will have, and that's the reason why they are extracted/disconnected when they are encountered.

As an example, the life of the CPU cache is quite shorter than a registry inside an HDD. So, the extraction procedure has a particular order just to provide the most amount of data possible.

## Evidence conservation techniques

This process is a must-do in terms of forensics, you shouldn't work with the original evidence. In a computer, all the non-volatile data is stored in HDDs, and for that reason, it's required to perform disk cloning or a disk generation image in order to work with it.

When performing a disk cloning process, we are just generating a physical disk duplication from one disk to another. Here, the second disk (the one that is going to receive the information) should be empty or at least filled with 0s (zeros), and of course, have to match with the same specs as the original

If you are deciding to work with disk images, you are basically generating a file that should contain the same evidence bit by bit. This digital file it's really helpful because of the ease of duplications and the versatility in terms of support. The disadvantage here is that your receiving device needs a lot of disk space and memory to store and process this new disk image.

Regardless of the method used, the tool for evidence conservation must perform bit-to-bit copies, has certain write protection, checksum calculations and comparisons, error registry, and status reports (at least!)

There are SSD disks as well, the process differs a little bit. If constant changes are made in the writing sectors they are sometimes discarded, at least the files with errors. The big challenge when using SSD is the hash calculating process, it will vary continuously, leading to the impossibility of identifying changes.

The disk image generation for the disk is considerably better for SDD scenarios.

Great, but what if the media is corrupted or damaged? Well, if you have the skills to re-build the filesystem, that's ok, but there are some techniques for checking if a disk is damaged or not.

1. De-attach the disk from the original device, and plug it in a proper lab (io restrictions)

2. Check if the electronic/mechanic functionality it's ok and avoid any cost that the OS boots up

3. Then, check if the `BIOS/UEFI` recognizes the disk. If not, scale up your problem to a specialist

#### How to recover logical damage?

1. The hardest one = **Knowledge protocol**, which basically tells you to rebuild everything without any guarantee on the data preservation

2. The **consistency checking**, which again invites you to rebuild the filesystem based on known patterns and information from located files found on the evaluated device.

In a general manner, the data should not be modified by any means and in hardware levels. This will destroy any sort of integrity. There are some working protocols to apply along with chain custody activities. A logical or physical unit can be altered even at the time when it's connected to a computer. All the OS modifies the units when are connected, simply by adding a temp file or by changing a timestamp value.

For that reason exists writing blockers, in a few words, they invalid the connected unit from writing permissions.

### Writing blockers

There are **hardware** and **software** **blockers**, the first one is an electronic interface that acts between the computer and the disk, the software blockers usually are part of a forensic suite that works as a utility for other activities.

The main goal of the blockers is to preserve the integrity of the data, by providing physical protection, or logical protection in the custody chain, hashes, and disk cloning

#### Avoiding writing in Memories

1. Open `regedit` in `cmd`

2. Go to the `HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control`

3. Add a new key called: `StorageDevicePolicies`, set it as `DWORD 32 bits`, and the value needs to be: `WriteProtect: 1`

4. After this, reboot your Windows and then connect your USB drive.

### Carving

The carving technique consists of evaluating each sector of an HDD in order to recover deleted files, by identifying header files indexed or not.

To avoid Carving is preferable to use a safe deletion mechanism. The idea behind this is to overwrite the remaining space, however, if you perform any type of encryption, you are probably just fine

Windows offers [SDelete](https://docs.microsoft.com/en-us/sysinternals/downloads/sdelete) for this.

Extract the content in a folder and run this command: `sdelete.exe -h` (for instructions).

Another amazing tool for this is the [WCWipe](https://www.jetico.com/data-wiping/wipe-files-bcwipe) suite. If you are a Linux user, check the **SIFT workstation**, or the OS distributions **Caine**, **Santoku**, and **Helix**

Both tools are general-purpose, but the reality is that filesystems are evolved and new versions appeared in recent times.

For old FAT systems, the Carving process does not delete files directly, the "file" space becomes available because the file's index is unlinked, this unlinked process enables overwriting capability of that spaces without fully deleting the previous information. Any recovery program can look up to that free clusters, the ones without any overwritten data, and seek old information.

In the FAT filesystem, there's static file size, delimited to only one file per cluster even when there's free space left.

Windows systems use NTFS, internally every file is tracked with the MFT (Master file table), along with a flag in the MFT record that will tell the system if the file is active or not. When deleting, the file's MFT is set to inactive but the clusters ain't deleted, the indexing still up.

[WinRecovery's](https://www.winrecovery.com/) [WinUndelete](https://www.winundelete.com/) is a more advanced tool to previsualize, recover and analyze files in details.

## Evidence Containerization

This is an important task in the practical POV. 

You may be thinking when to store? Simple, when the information is big enough to process with limited resources, or when an incidence occurs and historical data is required (mostly on enterprise scenarios).

There's a lot of precaution mechanisms and recommendations to follow based on securing evidence, electrostatic aisle for electronic devices, access control, theft, electric incidence, dust and so much on. 

The wrong protection of the evidence can invalid the complete investigation.