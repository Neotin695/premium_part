import 'component_model.dart';

class MotherboardModel extends ComponentModel {
  String manufacturer;
  int socketId;
  int chipsetId;
  String formFactor;
  int maxMemory;
  int memorySlots;
  int pciSlots;
  int pciX1Slots;
  int pciX4Slots;
  int pciX8Slots;
  int pciX16Slots;
  int mSataSlots;
  int sataSlots;

  
  MotherboardModel({
    required super.id,
    required super.title,
    required super.slug,
    required this.manufacturer,
    required this.socketId,
    required this.chipsetId,
    required this.formFactor,
    required this.maxMemory,
    required this.memorySlots,
    required this.pciSlots,
    required this.pciX1Slots,
    required this.pciX4Slots,
    required this.pciX8Slots,
    required this.pciX16Slots,
    required this.mSataSlots,
    required this.sataSlots,
    required super.image,
    required super.link,
  });

  factory MotherboardModel.fromMap(Map<String, dynamic> json) =>
      MotherboardModel(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        manufacturer: json["manufacturer"],
        socketId: json["socket_id"],
        chipsetId: json["chipset_id"],
        formFactor: json["form_factor"],
        maxMemory: json["max_memory"],
        memorySlots: json["memory_slots"],
        pciSlots: json["pci_slots"],
        pciX1Slots: json["pci_x1_slots"],
        pciX4Slots: json["pci_x4_slots"],
        pciX8Slots: json["pci_x8_slots"],
        pciX16Slots: json["pci_x16_slots"],
        mSataSlots: json["m_sata_slots"],
        sataSlots: json["sata_slots"],
        image: json["image"],
        link: json["link"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "slug": slug,
        "manufacturer": manufacturer,
        "socket_id": socketId,
        "chipset_id": chipsetId,
        "form_factor": formFactor,
        "max_memory": maxMemory,
        "memory_slots": memorySlots,
        "pci_slots": pciSlots,
        "pci_x1_slots": pciX1Slots,
        "pci_x4_slots": pciX4Slots,
        "pci_x8_slots": pciX8Slots,
        "pci_x16_slots": pciX16Slots,
        "m_sata_slots": mSataSlots,
        "sata_slots": sataSlots,
        "image": image,
        "link": link,
      };
}
