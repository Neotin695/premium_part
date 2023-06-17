import 'package:flutter/material.dart';
import 'package:permium_parts/core/common/common.dart';
import 'package:sizer/sizer.dart';

class SelectedPartView extends StatelessWidget {
  const SelectedPartView({super.key});

  @override
  Widget build(BuildContext context) {
    final part = Common.selectedPart;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 2.h),
            Text('Here you can see all selected components',
                style: TextStyle(fontSize: 18.sp)),
            SizedBox(height: 5.h),
            ListTile(
              title: Text(part.cpu != null
                  ? part.cpu!.title
                  : 'No Component selected yet!'),
              trailing:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            ),
            const Divider(),
            ListTile(
              title: Text(part.gpu == null
                  ? 'No Component selected yet!'
                  : part.gpu!.title),
              trailing:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            ),
            const Divider(),
            ListTile(
              title: Text(part.motherboard == null
                  ? 'No Component selected yet!'
                  : part.motherboard!.title),
              subtitle: part.motherboard == null
                  ? const Text('')
                  : Text(
                      '${part.motherboard!.pciX16Slots}, ${part.motherboard!.pciX1Slots}, ${part.motherboard!.pciX4Slots} ${part.motherboard!.pciX8Slots}, ${part.motherboard!.pciSlots}, ${part.motherboard!.maxMemory}, ${part.motherboard!.mSataSlots}'),
              trailing:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            ),
            const Divider(),
            part.memory.isEmpty
                ? ListTile(
                    title: const Text('No Component selected yet!'),
                    trailing: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.add)),
                  )
                : SizedBox(
                    height: 15.h,
                    child: ListView.builder(
                      itemCount: part.memory.length,
                      itemBuilder: (_, index) {
                        final memory = part.memory[index];
                        return ListTile(
                          title: Text(memory.title),
                          subtitle: Text(
                              '${memory.capacityUnit} ${memory.capacity}, ${memory.casLatency} ${memory.power}, ${memory.color}, ${memory.rgb}'),
                          trailing: IconButton(
                              onPressed: () {}, icon: const Icon(Icons.remove)),
                        );
                      },
                    ),
                  ),
            const Divider(),
            ListTile(
              title: Text(part.cooler == null
                  ? 'No Component selected yet!'
                  : part.cooler!.title),
              trailing:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            ),
            const Divider(),
            part.storage.isEmpty
                ? ListTile(
                    title: const Text('No Component selected yet!'),
                    trailing: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.add)),
                  )
                : SizedBox(
                    height: 15.h,
                    child: ListView.builder(
                      itemCount: part.storage.length,
                      itemBuilder: (_, index) {
                        final storage = part.storage[index];
                        return ListTile(
                          title: Text(storage.title),
                          subtitle: Text(
                              '${storage.cacheUnit} ${storage.cache}, ${storage.capacityUnit} ${storage.capacity}, ${storage.type}, ${storage.rpm}'),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.remove),
                          ),
                        );
                      },
                    ),
                  ),
            const Divider(),
            ListTile(
              title: Text(part.powersupply == null
                  ? 'No Component selected yet!'
                  : part.powersupply!.title),
              trailing:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            ),
            const Divider(),
            ListTile(
              title: Text(part.cases == null
                  ? 'No Component selected yet!'
                  : part.cases!.title),
              trailing:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
