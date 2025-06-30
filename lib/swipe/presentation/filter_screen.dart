import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // Location filter (single select for simplicity)
  String? selectedLocation;
  final List<String> locations = ['New York', 'Los Angeles', 'Chicago', 'Houston'];

  // Price Range filter
  RangeValues priceRange = const RangeValues(300, 2000);

  // Property Types (multi-select)
  final List<String> propertyTypes = ['Apartment', 'House', 'Studio', 'Room', 'Shared Room'];
  Set<String> selectedPropertyTypes = {};

  // Flatmate Age Range
  RangeValues ageRange = const RangeValues(18, 50);

  // Number of bedrooms
  RangeValues bedroomsRange = const RangeValues(1, 4);

  // Flatmate preferences
  String? selectedGender; // 'Any', 'Male', 'Female'
  bool lgbtqFriendly = false;
  bool smokingAllowed = false;
  bool petsAllowed = false;

  // Amenities (checkboxes)
  bool furnished = false;
  bool internetIncluded = false;
  bool washerDryer = false;
  bool parking = false;
  bool balcony = false;
  bool wheelchairAccessible = false;

  // Lease length
  String? selectedLeaseLength;
  final List<String> leaseLengths = ['Short term', 'Long term', 'Month-to-month'];

  // Move-in date
  DateTime? selectedMoveInDate;

  // Flatshare style
  final List<String> flatshareStyles = ['Quiet', 'Social'];
  Set<String> selectedFlatshareStyles = {};

  // Availability status
  String? selectedAvailability;
  final List<String> availabilityOptions = ['Immediate', 'Upcoming'];

  Future<void> _pickMoveInDate() async {
    DateTime initialDate = selectedMoveInDate ?? DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 2),
    );
    if (picked != null && picked != selectedMoveInDate) {
      setState(() {
        selectedMoveInDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Location
          const Text('Location', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 10,
            children: locations.map((loc) {
              bool isSelected = selectedLocation == loc;
              return ChoiceChip(
                label: Text(
                  loc,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
                selected: isSelected,
                onSelected: (_) {
                  setState(() {
                    selectedLocation = isSelected ? null : loc;
                  });
                },
                selectedColor: Colors.green,
                backgroundColor: Colors.grey[300],
                showCheckmark: false,
              );
            }).toList(),
          ),
          const SizedBox(height: 24),

          // Price Range
          const Text('Price Range (€)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          RangeSlider(
            values: priceRange,
            min: 0,
            max: 5000,
            divisions: 100,
            labels: RangeLabels('€${priceRange.start.round()}', '€${priceRange.end.round()}'),
            activeColor: Colors.green,
            onChanged: (values) {
              setState(() {
                priceRange = values;
              });
            },
          ),
          const SizedBox(height: 24),

          // Property Types
          const Text('Property Type', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          Wrap(
            spacing: 10,
            children: propertyTypes.map((type) {
              bool isSelected = selectedPropertyTypes.contains(type);
              return FilterChip(
                label: Text(
                  type,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      selectedPropertyTypes.add(type);
                    } else {
                      selectedPropertyTypes.remove(type);
                    }
                  });
                },
                selectedColor: Colors.green,
                backgroundColor: Colors.grey[300],
                labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
                showCheckmark: false,
              );
            }).toList(),
          ),
          const SizedBox(height: 24),

          const Text('Preferred Flatmate Age Range', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          RangeSlider(
            values: ageRange,
            min: 18,
            max: 100,
            divisions: 82,
            labels: RangeLabels('${ageRange.start.round()}', '${ageRange.end.round()}'),
            activeColor: Colors.green,
            onChanged: (values) {
              setState(() {
                ageRange = values;
              });
            },
          ),
          const SizedBox(height: 24),

          // Bedrooms Range
          const Text('Number of Bedrooms', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          RangeSlider(
            values: bedroomsRange,
            min: 0,
            max: 10,
            divisions: 10,
            labels: RangeLabels('${bedroomsRange.start.round()}', '${bedroomsRange.end.round()}'),
            activeColor: Colors.green,
            onChanged: (values) {
              setState(() {
                bedroomsRange = values;
              });
            },
          ),
          const SizedBox(height: 24),

          // Flatmate Gender Preference
          const Text('Flatmate Gender Preference', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          Wrap(
            spacing: 10,
            children: ['Any', 'Male', 'Female'].map((gender) {
              bool isSelected = selectedGender == gender;
              return ChoiceChip(
                label: Text(
                  gender,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
                selected: isSelected,
                onSelected: (_) {
                  setState(() {
                    selectedGender = isSelected ? null : gender;
                  });
                },
                selectedColor: Colors.green,
                backgroundColor: Colors.grey[300],
                showCheckmark: false,
              );
            }).toList(),
          ),
          const SizedBox(height: 24),

          // LGBTQ+ Friendly
          CheckboxListTile(
            title: const Text('LGBTQ+ Friendly'),
            value: lgbtqFriendly,
            onChanged: (val) {
              setState(() {
                lgbtqFriendly = val ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),

          // Smoking Allowed
          CheckboxListTile(
            title: const Text('Smoking Allowed'),
            value: smokingAllowed,
            onChanged: (val) {
              setState(() {
                smokingAllowed = val ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),

          // Pets Allowed
          CheckboxListTile(
            title: const Text('Pets Allowed'),
            value: petsAllowed,
            onChanged: (val) {
              setState(() {
                petsAllowed = val ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),

          // Amenities Section
          const Divider(height: 32),
          const Text('Amenities', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          CheckboxListTile(
            title: const Text('Furnished'),
            value: furnished,
            onChanged: (val) {
              setState(() {
                furnished = val ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          CheckboxListTile(
            title: const Text('Internet Included'),
            value: internetIncluded,
            onChanged: (val) {
              setState(() {
                internetIncluded = val ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          CheckboxListTile(
            title: const Text('Washer / Dryer'),
            value: washerDryer,
            onChanged: (val) {
              setState(() {
                washerDryer = val ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          CheckboxListTile(
            title: const Text('Parking'),
            value: parking,
            onChanged: (val) {
              setState(() {
                parking = val ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          CheckboxListTile(
            title: const Text('Balcony / Garden'),
            value: balcony,
            onChanged: (val) {
              setState(() {
                balcony = val ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          CheckboxListTile(
            title: const Text('Wheelchair Accessible'),
            value: wheelchairAccessible,
            onChanged: (val) {
              setState(() {
                wheelchairAccessible = val ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),

          const SizedBox(height: 24),

          // Lease Length (Radio buttons)
          const Text('Lease Length', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          ...leaseLengths.map((lease) => RadioListTile<String>(
                title: Text(lease),
                value: lease,
                groupValue: selectedLeaseLength,
                onChanged: (val) {
                  setState(() {
                    selectedLeaseLength = val;
                  });
                },
              )),

          const SizedBox(height: 24),

          // Move-in Date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Move-in Date', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              TextButton(
                onPressed: _pickMoveInDate,
                child: Text(selectedMoveInDate == null
                    ? 'Select Date'
                    : '${selectedMoveInDate!.day}/${selectedMoveInDate!.month}/${selectedMoveInDate!.year}'),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Flatshare Style (multi-select chips)
          const Text('Flatshare Style', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          Wrap(
            spacing: 10,
            children: flatshareStyles.map((style) {
              bool isSelected = selectedFlatshareStyles.contains(style);
              return FilterChip(
                label: Text(
                  style,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      selectedFlatshareStyles.add(style);
                    } else {
                      selectedFlatshareStyles.remove(style);
                    }
                  });
                },
                selectedColor: Colors.green,
                backgroundColor: Colors.grey[300],
                labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
                showCheckmark: false,
              );
            }).toList(),
          ),

          const SizedBox(height: 24),

          // Availability Status (choice chips)
          const Text('Availability Status', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          Wrap(
            spacing: 10,
            children: availabilityOptions.map((status) {
              bool isSelected = selectedAvailability == status;
              return ChoiceChip(
                label: Text(
                  status,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
                selected: isSelected,
                onSelected: (_) {
                  setState(() {
                    selectedAvailability = isSelected ? null : status;
                  });
                },
                selectedColor: Colors.green,
                backgroundColor: Colors.grey[300],
                showCheckmark: false,
              );
            }).toList(),
          ),

          const SizedBox(height: 32),

          // Apply Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // TODO: Apply filter logic, e.g., pass back selections or update results
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 10, 134, 43),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text(
                'Apply Filters',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}