pactl load-module module-null-sink sink_name=fake_output sink_properties=device.description="FakeOutput"
pactl load-module module-remap-source master=fake_output.monitor source_name=fake_input source_properties=device.description="FakeInput"
