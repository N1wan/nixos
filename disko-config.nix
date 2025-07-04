{
	disko.devices = {
		disk = {
			my-disk = {
				device = "/dev/sda";
				type = "disk";
				content = {
					type = "gpt";
					partitions = {
						ESP = {
							type = "EF00";
							size = "1G";
							content = {
								type = "filesystem";
								format = "vfat";
								mountpoint = "/boot";
								mountOptions = [ "umask=0077" ];
							};
						};

						swap = {
							type = "8200";
							size = "8G";
							content = {
								type = "swap";
								discardPolicy = "both";
								resumeDevice = true;
							};
						};

						root = {
							size = "100%";
							content = {
								type = "filesystem";
								format = "ext4";
								mountpoint = "/";
							};
						};
					};
				};
			};
		};
	};
}
