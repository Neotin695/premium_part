import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:permium_parts/core/common/common.dart';
import 'package:permium_parts/views/systembuilder/bloc/systembuilder_bloc.dart';
import 'package:permium_parts/views/systembuilder/pages/all_parts_page.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constances/api_const.dart';

class SelectedPartView extends StatefulWidget {
  const SelectedPartView({super.key});

  @override
  State<SelectedPartView> createState() => _SelectedPartViewState();
}

class _SelectedPartViewState extends State<SelectedPartView> {
  @override
  Widget build(BuildContext context) {
    final part = Common.selectedPart;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 5.h),
            ListTile(
              leading: Image.asset(
                'assets/images/placeholder.png',
                width: 20.w,
                height: 20.h,
                fit: BoxFit.cover,
              ),
              onTap: () async {
                if (!await launchUrl(Uri.parse(part.cpu!.link))) {}
              },
              title: Text(!_exists(part.cpu)
                  ? part.cpu!.title
                  : 'No cpu selected yet!'),
              trailing: IconButton(
                  onPressed: () {
                    if (_exists(part.cpu)) {
                      Navigator.pushNamed(context, AllPartsPage.routeName,
                          arguments: Components.cpus);
                    } else {
                      part.cpu = null;
                      Common.selectedPart.cpu = null;
                      setState(() {});
                    }
                  },
                  icon: Icon(_exists(part.cpu) ? Icons.add : Icons.remove)),
            ),
            const Divider(),
            ListTile(
              leading: Image.asset(
                'assets/images/placeholder.png',
                width: 20.w,
                height: 20.h,
                fit: BoxFit.cover,
              ),
              onTap: () async {
                if (!await launchUrl(Uri.parse(part.gpu!.link))) {}
              },
              title: Text(
                  _exists(part.gpu) ? 'No gpu selected yet!' : part.gpu!.title),
              trailing: IconButton(
                  onPressed: () {
                    if (_exists(part.gpu)) {
                      Navigator.pushNamed(context, AllPartsPage.routeName,
                          arguments: Components.gpus);
                    } else {
                      part.gpu = null;
                      Common.selectedPart.gpu = null;
                      setState(() {});
                    }
                  },
                  icon: Icon(_exists(part.gpu) ? Icons.add : Icons.remove)),
            ),
            const Divider(),
            ListTile(
              leading: Image.asset(
                'assets/images/placeholder.png',
                width: 20.w,
                height: 20.h,
                fit: BoxFit.cover,
              ),
              onTap: () async {
                if (!await launchUrl(Uri.parse(part.motherboard!.link))) {}
              },
              title: Text(_exists(part.motherboard)
                  ? 'No motherboard selected yet!'
                  : part.motherboard!.title),
              subtitle: _exists(part.motherboard)
                  ? const Text('')
                  : Text(
                      '${part.motherboard!.pciX16Slots}, ${part.motherboard!.pciX1Slots}, ${part.motherboard!.pciX4Slots} ${part.motherboard!.pciX8Slots}, ${part.motherboard!.pciSlots}, ${part.motherboard!.maxMemory}, ${part.motherboard!.mSataSlots}'),
              trailing: IconButton(
                  onPressed: () {
                    if (_exists(part.motherboard)) {
                      Navigator.pushNamed(context, AllPartsPage.routeName,
                          arguments: Components.motherboards);
                    } else {
                      part.motherboard = null;
                      Common.selectedPart.motherboard = null;
                      setState(() {});
                    }
                  },
                  icon: Icon(
                      _exists(part.motherboard) ? Icons.add : Icons.remove)),
            ),
            const Divider(),
            part.memory.isEmpty
                ? ListTile(
                    leading: Image.asset(
                      'assets/images/placeholder.png',
                      width: 20.w,
                      height: 20.h,
                      fit: BoxFit.cover,
                    ),
                    title: const Text('No memories selected yet!'),
                    trailing: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AllPartsPage.routeName,
                              arguments: Components.memories);
                        },
                        icon: const Icon(Icons.add)),
                  )
                : SizedBox(
                    height: 15.h,
                    child: ListView.builder(
                      itemCount: part.memory.length,
                      itemBuilder: (_, index) {
                        final memory = part.memory[index];
                        return ListTile(
                          leading: CachedNetworkImage(
                              height: 5.h,
                              fit: BoxFit.cover,
                              imageUrl:
                                  '${ApiConst.baseUrlImage}/normal_user/image/memories/${memory.image}',
                              progressIndicatorBuilder: (_, url, don) {
                                return const CircularProgressIndicator();
                              }),
                          onTap: () async {
                            if (!await launchUrl(Uri.parse(memory.link))) {}
                          },
                          title: Text(memory.title),
                          subtitle: Text(
                              '${memory.capacityUnit} ${memory.capacity}, ${memory.casLatency} ${memory.power}, ${memory.color}, ${memory.rgb}'),
                          trailing: IconButton(
                              onPressed: () {
                                part.memory.remove(memory);
                                Common.selectedPart.memory.remove(memory);
                                setState(() {});
                              },
                              icon: const Icon(Icons.remove)),
                        );
                      },
                    ),
                  ),
            const Divider(),
            ListTile(
              leading: Image.asset(
                'assets/images/placeholder.png',
                width: 20.w,
                height: 20.h,
                fit: BoxFit.cover,
              ),
              title: Text(part.cooler == null
                  ? 'No cooler selected yet!'
                  : part.cooler!.title),
              trailing: IconButton(
                  onPressed: () {
                    if (_exists(part.motherboard)) {
                      Navigator.pushNamed(context, AllPartsPage.routeName,
                          arguments: Components.coolers);
                    } else {
                      part.cooler = null;
                      Common.selectedPart.cooler = null;
                      setState(() {});
                    }
                  },
                  icon: Icon(
                      _exists(part.motherboard) ? Icons.add : Icons.remove)),
            ),
            const Divider(),
            part.storage.isEmpty
                ? ListTile(
                    leading: Image.asset(
                      'assets/images/placeholder.png',
                      width: 20.w,
                      height: 20.h,
                      fit: BoxFit.cover,
                    ),
                    title: const Text('No storages selected yet!'),
                    trailing: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AllPartsPage.routeName,
                              arguments: Components.storages);
                        },
                        icon: const Icon(Icons.add)),
                  )
                : SizedBox(
                    height: 15.h,
                    child: ListView.builder(
                      itemCount: part.storage.length,
                      itemBuilder: (_, index) {
                        final storage = part.storage[index];
                        return ListTile(
                          leading: CachedNetworkImage(
                              height: 5.h,
                              fit: BoxFit.cover,
                              imageUrl:
                                  '${ApiConst.baseUrlImage}/normal_user/image/memories/${storage.image}',
                              progressIndicatorBuilder: (_, url, don) {
                                return const CircularProgressIndicator();
                              }),
                          title: Text(storage.title),
                          subtitle: Text(
                              '${storage.cacheUnit} ${storage.cache}, ${storage.capacityUnit} ${storage.capacity}, ${storage.type}, ${storage.rpm}'),
                          trailing: IconButton(
                              onPressed: () {
                                part.storage.remove(storage);
                                Common.selectedPart.storage.remove(storage);
                                setState(() {});
                              },
                              icon: const Icon(Icons.remove)),
                        );
                      },
                    ),
                  ),
            const Divider(),
            ListTile(
              leading: Image.asset(
                'assets/images/placeholder.png',
                width: 20.w,
                height: 20.h,
                fit: BoxFit.cover,
              ),
              onTap: () async {
                if (!await launchUrl(Uri.parse(part.powersupply!.link))) {}
              },
              title: Text(_exists(part.powersupply)
                  ? 'No powersupply selected yet!'
                  : part.powersupply!.title),
              trailing: IconButton(
                  onPressed: () {
                    if (_exists(part.powersupply)) {
                      Navigator.pushNamed(context, AllPartsPage.routeName,
                          arguments: Components.powersupplies);
                    } else {
                      part.powersupply = null;
                      Common.selectedPart.powersupply = null;
                      setState(() {});
                    }
                  },
                  icon: Icon(
                      _exists(part.powersupply) ? Icons.add : Icons.remove)),
            ),
            const Divider(),
            ListTile(
              leading: Image.asset(
                'assets/images/placeholder.png',
                width: 20.w,
                height: 20.h,
                fit: BoxFit.cover,
              ),
              onTap: () async {
                if (!await launchUrl(Uri.parse(part.cases!.link))) {}
              },
              title: Text(_exists(part.cases)
                  ? 'No case selected yet!'
                  : part.cases!.title),
              trailing: IconButton(
                  onPressed: () {
                    if (_exists(part.cases)) {
                      Navigator.pushNamed(context, AllPartsPage.routeName,
                          arguments: Components.cases);
                    } else {
                      part.cases = null;
                      Common.selectedPart.cases = null;
                      setState(() {});
                    }
                  },
                  icon: Icon(_exists(part.cases) ? Icons.add : Icons.remove)),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }

  bool _exists(part) {
    return part == null;
  }
}
