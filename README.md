# SystemVerilog Memory Testbench

A professional, layered verification environment built to validate a **Synchronous Single-Port RAM** module. This project demonstrates modern Hardware Verification (HV) concepts including constrained-random stimulus, interface-based design, and automated checking.

## 📋 Features
* **Layered Architecture:** Organized into Transaction, Generator, Driver, Monitor, and Scoreboard.
* **Constrained Randomization:** Uses `rand` and `constraint` blocks to automate corner-case testing (e.g., address boundary checks).
* **Interface-Driven:** Uses SV `interface` and `virtual interface` to decouple the testbench from the RTL.
* **Self-Checking Scoreboard:** Implements a golden reference model (associative array) to verify data integrity in real-time.
* **Mailbox Communication:** Thread-safe communication between components using SV mailboxes.

---

## 🏗️ Testbench Architecture

The environment is structured to separate "what" is being tested from "how" the signals are driven:

1.  **Transaction:** Defines the data packet (Address, Data, Control signals).
2.  **Generator:** Creates randomized packets and sends them to the Driver.
3.  **Driver:** Unpacks transactions and drives the physical pins of the DUT.
4.  **Monitor:** Samples the DUT interface and captures output activity.
5.  **Scoreboard:** Compares sampled output against expected values to report Pass/Fail.

---

## 📂 File Structure

| File | Description |
| :--- | :--- |
| `memory_rtl.sv` | The Verilog/SystemVerilog RAM design under test (DUT). |
| `interface.sv` | Defines signals, clocking blocks, and modports. |
| `transaction.sv` | Data object with constraints for randomization. |
| `generator.sv` | Logic to generate random test vectors. |
| `driver.sv` | Logic to drive transactions into the DUT pins. |
| `monitor.sv` | Logic to observe DUT pins and send data to scoreboard. |
| `scoreboard.sv` | The verification engine that checks for data errors. |
| `environment.sv` | Container class that connects all TB components. |
| `top_tb.sv` | The top-level module (Clock gen, Interface instance, DUT instance). |

---

## 🚀 Getting Started

### Prerequisites
You will need a SystemVerilog-compatible simulator such as:
* **Questa/ModelSim**
* **VCS**
* **Vivado Simulator**
* **EDA Playground** (Online)
