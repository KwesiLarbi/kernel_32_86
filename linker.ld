/*  The bootloader will look at this image and start execution at the symbol 
    designatted as the entry point.
*/

/*  Tell where the various sections of the object files will be put in the final kernel
    image.
*/
SECTIONS
{
    /*  It used to be universally recommended to use 1M as a start offset,
        as it was effectively guaranteed to be available under BIOS systems.
        However, UEFI has made things more complicated, and experimental data 
        stringly suggests that 2M is a safer place to load. In 2016, a new
        feature was introduced to the multiboot2 spec to inform bootloaders
        that a kernel can be loaded anywhere within a range of addresses and 
        will be able to relocated itself to run from such a loader-selected
        address, in order to giv the loader freedom in selecting a span of
        memory which is verified to be available by the firmware, in order to
        work around the issue. This does not use that feature, so 2M was
        chosen as a safer option than the traditional 1M.
    */
    . = 2M;

    /*  First put the multiboot header, as it is required to be put very early
        in the image or the bootloader won't recognize the file format.
    */
    .text BLOCK(4K) : ALIGN(4K)
    {
        *(.multiboot)
        *(.text)
    }

    /* Read-only data */
    .rodata BLOCK(4K) : ALIGN(4K)
    {
        *(.rodata)
    }

    /* Read-write data (initialized) */
    .data BLOCK(4K): ALIGN(4K)
    {
        *(.data)
    }

    /* Read-write data (uninitialized) and stack */
    .bss BLOCK(4K) : ALIGN(4K)
    {
        *(COMMON)
        *(.bss)
    }

    /* Compilemay produce other sections. Add stuff here as needed */
}