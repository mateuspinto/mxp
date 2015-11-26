-- Aaron Severance
-- architecture_pkg.vhd
-- Copyright (C) 2012-2015 VectorBlox Computing, Inc.

-- Derived and architecture specific constants, types, and functions

-- synthesis library stream_writer_lib
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library work;
use work.util_pkg.all;

package architecture_pkg is
  constant SLAVE_REGISTERS : positive := 5;

--REGISTERS
  constant REG_NEXT_STATUS_LENGTH : natural := 0;
  --0 (R/W) Next Buffer status/length
  --This is inserted into queue with each packet.  Sticky so doesn't need to
  --be rewritten for each buffer if buffers are identical
  --Bit 31 means wait until start of packet before starting
  --Bit 30 reserved (likely will mean wait until end of packet after ending)
  --Bits 29-25 reserved
  --Bit 24 means interrupt upon completion of the packet
  --Low 24 bits buffer length (bytes)
  --Length must be multiple of burst size
  --If end of packet is recieved not on a burst boundary, addresses up until the
  --next burst boundary may be written with undefined data

  constant REG_NEXT_ADDRESS : natural := 1;
  --1 (W) Next Buffer Address
  --Start of the next buffer in memory.  Writing this register causes an
  --entry to be put into the buffer list, consisting of the address written
  --and the status/length in the Next Buffer status/length register.
  --If Buffer list is full, block.  To avoid blocking, read the "Buffer list
  --status" register to see if the buffer list is full first

  constant REG_RETURN_STATUS_LENGTH : natural  := 2;
  --2 (R) Return status
  --All 0's if no valid return buffer
  --Bit 31 means start of packet
  --Bit 30 means end of packet
  --Bit 29 means backpressure applied during writing (FIFO filled)
  --Bits 28 to 25 are reserved
  --Bit 24 means an interrupt was sent upon completion of the packet
  --Low 24 bits are length written in bytes.  Length is currently reported only
  --at burst granularity, so if an end of packet causes only part of a burst to
  --have valid data, there is no way to detect this (should be added eventually
  --for better generality)
  constant STATUS_STARTOFPACKET_BIT : natural  := 31;
  constant STATUS_ENDOFPACKET_BIT   : natural  := 30;
  constant STATUS_BACKPRESSURE_BIT  : natural  := 29;
  constant STATUS_RESERVED_LEFT     : natural  := 28;
  constant STATUS_RESERVED_RIGHT    : natural  := 25;
  constant STATUS_INTERRUPT_BIT     : natural  := 24;
  constant STATUS_LENGTH_LEFT       : natural  := 23;
  constant STATUS_LENGTH_RIGHT      : natural  := 0;
  constant STATUS_LENGTH_LENGTH     : positive := (STATUS_LENGTH_LEFT-STATUS_LENGTH_RIGHT)+1;

  constant REG_RETURN_ADDRESS : natural := 3;
  --3 (R) Return address
  --The address corresponding to the last valid return buffer read (by
  --reading the "Return status" register).

  constant REG_BUFFER_LIST_STATUS : natural := 4;
  --4 (R) Buffer list status
  --Bit 31: Buffer list full (writes will block)
  --Bits 30 to 16 reserved
  --Bits 15 to 8: Available buffers enqueued (not yet written, includes current)
  --Bits 7 to 0:  Valid return entries
end package;

package body architecture_pkg is
end architecture_pkg;
