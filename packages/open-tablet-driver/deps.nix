# Taken from https://github.com/OpenTabletDriver/OpenTabletDriver/tree/0.6.x (deps.nix)

{ fetchNuGet }: [
	(fetchNuGet { pname = "AtkSharp"; version = "3.24.24.34"; hash = "sha256-GrOzO4YDMKJNHAnqLF+c44iGYlvazGTOuRLUnuLbwco="; })
	(fetchNuGet { pname = "CairoSharp"; version = "3.24.24.34"; hash = "sha256-/80xbYSPU8+6twoXRjES8PtV7dKB6fQoe6EqBmawzV8="; })
	(fetchNuGet { pname = "Eto.Forms"; version = "2.5.10"; hash = "sha256-51NkW/COGLiGl/+niLJaPJY+ypG1a1OXw65HMunj4bQ="; })
	(fetchNuGet { pname = "Eto.Forms"; version = "2.5.11"; hash = "sha256-enxjfLwl+KEl//rG9pJ4VaQtAAycjHWP1Hp4ngKTBkE="; })
	(fetchNuGet { pname = "Eto.Platform.Gtk"; version = "2.5.11"; hash = "sha256-sqRlx0itUTncAfLaExymb2hdtoqLnkj/yvD9RM+XNuk="; })
	(fetchNuGet { pname = "GdkSharp"; version = "3.24.24.34"; hash = "sha256-pQOp2jft19vVN+gSjD0tHfNGucss7ruy1xyys6IHHWQ="; })
	(fetchNuGet { pname = "GioSharp"; version = "3.24.24.34"; hash = "sha256-/fZBfaKXlrdBuNh1/h0s1++5Ek4OnznXvzJx0uTbHQo="; })
	(fetchNuGet { pname = "GLibSharp"; version = "3.24.24.34"; hash = "sha256-eAYUYNHF37nIJnk7aRffzBj8b/rluqXERYy358YAd08="; })
	(fetchNuGet { pname = "GtkSharp"; version = "3.24.24.34"; hash = "sha256-i0XZfzUt9GNaZD1uXNd8x+pb1mPJqYrxQd15XOuHSAA="; })
	(fetchNuGet { pname = "HidSharpCore"; version = "1.2.1.1"; hash = "sha256-lM4o3FYBon8eQIMt4uiJAs8M0t4MW+joykiDX+lrdv4="; })
	(fetchNuGet { pname = "MessagePack"; version = "2.1.194"; hash = "sha256-QKq/zQKI3P9TBhhnnktaaeRr4f/12U+huxeaplPzT+w="; })
	(fetchNuGet { pname = "MessagePack.Annotations"; version = "2.1.194"; hash = "sha256-YCHelFO/hXW7Q3rkV/fQ32aZliSXUO7133kRH+HAcMo="; })
	(fetchNuGet { pname = "Microsoft.Bcl.AsyncInterfaces"; version = "1.1.1"; hash = "sha256-fAcX4sxE0veWM1CZBtXR/Unky+6sE33yrV7ohrWGKig="; })
	(fetchNuGet { pname = "Microsoft.Extensions.DependencyInjection"; version = "6.0.0-rc.1.21451.13"; hash = "sha256-zJQsAVTfA46hUV5q67BslsVn9yehYBclD06wg2UhyWQ="; })
	(fetchNuGet { pname = "Microsoft.Extensions.DependencyInjection.Abstractions"; version = "6.0.0-rc.1.21451.13"; hash = "sha256-oTYhI+lMwaQ7l9CfDHeNMBAdfofv4kHC0vqBZ7oJr4U="; })
	(fetchNuGet { pname = "Microsoft.NETCore.Platforms"; version = "1.1.0"; hash = "sha256-FeM40ktcObQJk4nMYShB61H/E8B7tIKfl9ObJ0IOcCM="; })
	(fetchNuGet { pname = "Microsoft.NETCore.Platforms"; version = "1.1.1"; hash = "sha256-8hLiUKvy/YirCWlFwzdejD2Db3DaXhHxT7GSZx/znJg="; })
	(fetchNuGet { pname = "Microsoft.NETCore.Platforms"; version = "3.0.0"; hash = "sha256-ocB+U+mMvi/xVwII7bGsIfAqSXiKVSnEMLHCODLJaK4="; })
	(fetchNuGet { pname = "Microsoft.NETCore.Targets"; version = "1.1.0"; hash = "sha256-0AqQ2gMS8iNlYkrD+BxtIg7cXMnr9xZHtKAuN4bjfaQ="; })
	(fetchNuGet { pname = "Microsoft.VisualStudio.Threading"; version = "16.7.56"; hash = "sha256-V2HB/0j+I/3iUT7mEVyeF11P/61cSpYcZQa1LnXuoI8="; })
	(fetchNuGet { pname = "Microsoft.VisualStudio.Threading.Analyzers"; version = "16.7.56"; hash = "sha256-4lsL6hg1mposZ62buQWBud1B4raV8Pl+BkyvM4FraRM="; })
	(fetchNuGet { pname = "Microsoft.VisualStudio.Validation"; version = "15.5.31"; hash = "sha256-/NWbGyad7wejY8QyxK8YWTgiRiUGjimaBgoLkWxOCao="; })
	(fetchNuGet { pname = "Microsoft.Win32.Primitives"; version = "4.3.0"; hash = "sha256-mBNDmPXNTW54XLnPAUwBRvkIORFM7/j0D0I2SyQPDEg="; })
	(fetchNuGet { pname = "Microsoft.Win32.Registry"; version = "4.6.0"; hash = "sha256-Wrj0Sc9srH5+ma0lCbgRYYP6gKgnlXcL6h7j7AU6nkQ="; })
	(fetchNuGet { pname = "Nerdbank.Streams"; version = "2.6.77"; hash = "sha256-rOBiYpZQ0rrM9wbWOjzCYIbxcWa3tCrdPt1rpDp3to0="; })
	(fetchNuGet { pname = "Newtonsoft.Json"; version = "12.0.2"; hash = "sha256-BW7sXT2LKpP3ylsCbTTZ1f6Mg1sR4yL68aJVHaJcTnA="; })
	(fetchNuGet { pname = "Newtonsoft.Json"; version = "13.0.1"; hash = "sha256-K2tSVW4n4beRPzPu3rlVaBEMdGvWSv/3Q1fxaDh4Mjo="; })
	(fetchNuGet { pname = "Octokit"; version = "0.50.0"; hash = "sha256-GJ+9HkF8FNOB7O2d32fPvMrmUqYcAJ4xToEFZWKR9sU="; })
	(fetchNuGet { pname = "PangoSharp"; version = "3.24.24.34"; hash = "sha256-/KdH3SA/11bkwPe/AXRph4v4a2cjbUjDvo4+OhkJEOQ="; })
	(fetchNuGet { pname = "runtime.any.System.Collections"; version = "4.3.0"; hash = "sha256-4PGZqyWhZ6/HCTF2KddDsbmTTjxs2oW79YfkberDZS8="; })
	(fetchNuGet { pname = "runtime.any.System.Diagnostics.Tracing"; version = "4.3.0"; hash = "sha256-dsmTLGvt8HqRkDWP8iKVXJCS+akAzENGXKPV18W2RgI="; })
	(fetchNuGet { pname = "runtime.any.System.Globalization"; version = "4.3.0"; hash = "sha256-PaiITTFI2FfPylTEk7DwzfKeiA/g/aooSU1pDcdwWLU="; })
	(fetchNuGet { pname = "runtime.any.System.Globalization.Calendars"; version = "4.3.0"; hash = "sha256-AYh39tgXJVFu8aLi9Y/4rK8yWMaza4S4eaxjfcuEEL4="; })
	(fetchNuGet { pname = "runtime.any.System.IO"; version = "4.3.0"; hash = "sha256-vej7ySRhyvM3pYh/ITMdC25ivSd0WLZAaIQbYj/6HVE="; })
	(fetchNuGet { pname = "runtime.any.System.Reflection"; version = "4.3.0"; hash = "sha256-ns6f++lSA+bi1xXgmW1JkWFb2NaMD+w+YNTfMvyAiQk="; })
	(fetchNuGet { pname = "runtime.any.System.Reflection.Primitives"; version = "4.3.0"; hash = "sha256-LkPXtiDQM3BcdYkAm5uSNOiz3uF4J45qpxn5aBiqNXQ="; })
	(fetchNuGet { pname = "runtime.any.System.Resources.ResourceManager"; version = "4.3.0"; hash = "sha256-9EvnmZslLgLLhJ00o5MWaPuJQlbUFcUF8itGQNVkcQ4="; })
	(fetchNuGet { pname = "runtime.any.System.Runtime"; version = "4.3.0"; hash = "sha256-qwhNXBaJ1DtDkuRacgHwnZmOZ1u9q7N8j0cWOLYOELM="; })
	(fetchNuGet { pname = "runtime.any.System.Runtime.Handles"; version = "4.3.0"; hash = "sha256-PQRACwnSUuxgVySO1840KvqCC9F8iI9iTzxNW0RcBS4="; })
	(fetchNuGet { pname = "runtime.any.System.Runtime.InteropServices"; version = "4.3.0"; hash = "sha256-Kaw5PnLYIiqWbsoF3VKJhy7pkpoGsUwn4ZDCKscbbzA="; })
	(fetchNuGet { pname = "runtime.any.System.Text.Encoding"; version = "4.3.0"; hash = "sha256-Q18B9q26MkWZx68exUfQT30+0PGmpFlDgaF0TnaIGCs="; })
	(fetchNuGet { pname = "runtime.any.System.Text.Encoding.Extensions"; version = "4.3.0"; hash = "sha256-6MYj0RmLh4EVqMtO/MRqBi0HOn5iG4x9JimgCCJ+EFM="; })
	(fetchNuGet { pname = "runtime.any.System.Threading.Tasks"; version = "4.3.0"; hash = "sha256-agdOM0NXupfHbKAQzQT8XgbI9B8hVEh+a/2vqeHctg4="; })
	(fetchNuGet { pname = "runtime.debian.8-x64.runtime.native.System.Security.Cryptography.OpenSsl"; version = "4.3.2"; hash = "sha256-EbnOqPOrAgI9eNheXLR++VnY4pHzMsEKw1dFPJ/Fl2c="; })
	(fetchNuGet { pname = "runtime.fedora.23-x64.runtime.native.System.Security.Cryptography.OpenSsl"; version = "4.3.2"; hash = "sha256-mVg02TNvJc1BuHU03q3fH3M6cMgkKaQPBxraSHl/Btg="; })
	(fetchNuGet { pname = "runtime.fedora.24-x64.runtime.native.System.Security.Cryptography.OpenSsl"; version = "4.3.2"; hash = "sha256-g9Uiikrl+M40hYe0JMlGHe/lrR0+nN05YF64wzLmBBA="; })
	(fetchNuGet { pname = "runtime.native.System"; version = "4.3.0"; hash = "sha256-ZBZaodnjvLXATWpXXakFgcy6P+gjhshFXmglrL5xD5Y="; })
	(fetchNuGet { pname = "runtime.native.System.Net.Http"; version = "4.3.0"; hash = "sha256-c556PyheRwpYhweBjSfIwEyZHnAUB8jWioyKEcp/2dg="; })
	(fetchNuGet { pname = "runtime.native.System.Security.Cryptography.Apple"; version = "4.3.0"; hash = "sha256-2IhBv0i6pTcOyr8FFIyfPEaaCHUmJZ8DYwLUwJ+5waw="; })
	(fetchNuGet { pname = "runtime.native.System.Security.Cryptography.OpenSsl"; version = "4.3.2"; hash = "sha256-xqF6LbbtpzNC9n1Ua16PnYgXHU0LvblEROTfK4vIxX8="; })
	(fetchNuGet { pname = "runtime.opensuse.13.2-x64.runtime.native.System.Security.Cryptography.OpenSsl"; version = "4.3.2"; hash = "sha256-aJBu6Frcg6webvzVcKNoUP1b462OAqReF2giTSyBzCQ="; })
	(fetchNuGet { pname = "runtime.opensuse.42.1-x64.runtime.native.System.Security.Cryptography.OpenSsl"; version = "4.3.2"; hash = "sha256-Mpt7KN2Kq51QYOEVesEjhWcCGTqWckuPf8HlQ110qLY="; })
	(fetchNuGet { pname = "runtime.osx.10.10-x64.runtime.native.System.Security.Cryptography.Apple"; version = "4.3.0"; hash = "sha256-serkd4A7F6eciPiPJtUyJyxzdAtupEcWIZQ9nptEzIM="; })
	(fetchNuGet { pname = "runtime.osx.10.10-x64.runtime.native.System.Security.Cryptography.OpenSsl"; version = "4.3.2"; hash = "sha256-JvMltmfVC53mCZtKDHE69G3RT6Id28hnskntP9MMP9U="; })
	(fetchNuGet { pname = "runtime.rhel.7-x64.runtime.native.System.Security.Cryptography.OpenSsl"; version = "4.3.2"; hash = "sha256-QfFxWTVRNBhN4Dm1XRbCf+soNQpy81PsZed3x6op/bI="; })
	(fetchNuGet { pname = "runtime.ubuntu.14.04-x64.runtime.native.System.Security.Cryptography.OpenSsl"; version = "4.3.2"; hash = "sha256-EaJHVc9aDZ6F7ltM2JwlIuiJvqM67CKRq682iVSo+pU="; })
	(fetchNuGet { pname = "runtime.ubuntu.16.04-x64.runtime.native.System.Security.Cryptography.OpenSsl"; version = "4.3.2"; hash = "sha256-PHR0+6rIjJswn89eoiWYY1DuU8u6xRJLrtjykAMuFmA="; })
	(fetchNuGet { pname = "runtime.ubuntu.16.10-x64.runtime.native.System.Security.Cryptography.OpenSsl"; version = "4.3.2"; hash = "sha256-LFkh7ua7R4rI5w2KGjcHlGXLecsncCy6kDXLuy4qD/Q="; })
	(fetchNuGet { pname = "runtime.unix.Microsoft.Win32.Primitives"; version = "4.3.0"; hash = "sha256-LZb23lRXzr26tRS5aA0xyB08JxiblPDoA7HBvn6awXg="; })
	(fetchNuGet { pname = "runtime.unix.System.Diagnostics.Debug"; version = "4.3.0"; hash = "sha256-ReoazscfbGH+R6s6jkg5sIEHWNEvjEoHtIsMbpc7+tI="; })
	(fetchNuGet { pname = "runtime.unix.System.IO.FileSystem"; version = "4.3.0"; hash = "sha256-Pf4mRl6YDK2x2KMh0WdyNgv0VUNdSKVDLlHqozecy5I="; })
	(fetchNuGet { pname = "runtime.unix.System.Net.Primitives"; version = "4.3.0"; hash = "sha256-pHJ+I6i16MV6m77uhTC6GPY6jWGReE3SSP3fVB59ti0="; })
	(fetchNuGet { pname = "runtime.unix.System.Private.Uri"; version = "4.3.0"; hash = "sha256-c5tXWhE/fYbJVl9rXs0uHh3pTsg44YD1dJvyOA0WoMs="; })
	(fetchNuGet { pname = "runtime.unix.System.Runtime.Extensions"; version = "4.3.0"; hash = "sha256-l8S9gt6dk3qYG6HYonHtdlYtBKyPb29uQ6NDjmrt3V4="; })
	(fetchNuGet { pname = "SharpZipLib"; version = "1.3.3"; hash = "sha256-HWEQTKh9Ktwg/zIl079dAiH+ob2ShWFAqLgG6XgIMr4="; })
	(fetchNuGet { pname = "StreamJsonRpc"; version = "2.6.121"; hash = "sha256-5tSk90kVoj0YRbuS1YIohu+c5zvykNd+s1MLfsK8+3c="; })
	(fetchNuGet { pname = "System.Buffers"; version = "4.3.0"; hash = "sha256-XqZWb4Kd04960h4U9seivjKseGA/YEIpdplfHYHQ9jk="; })
	(fetchNuGet { pname = "System.Collections"; version = "4.3.0"; hash = "sha256-afY7VUtD6w/5mYqrce8kQrvDIfS2GXDINDh73IjxJKc="; })
	(fetchNuGet { pname = "System.Collections.Concurrent"; version = "4.3.0"; hash = "sha256-KMY5DfJnDeIsa13DpqvyN8NkReZEMAFnlmNglVoFIXI="; })
	(fetchNuGet { pname = "System.Collections.Immutable"; version = "1.7.1"; hash = "sha256-WMMAUqoxT3J1gW9DI8v31VAuhwqTc4Posose5jq1BNo="; })
	(fetchNuGet { pname = "System.CommandLine"; version = "2.0.0-beta4.22272.1"; hash = "sha256-zSO+CYnMH8deBHDI9DHhCPj79Ce3GOzHCyH1/TiHxcc="; })
	(fetchNuGet { pname = "System.ComponentModel.Annotations"; version = "4.7.0"; hash = "sha256-PxG9lvf2v/IAIs7LhO4Ur+EpX/L5nYbEs0D21gypoRs="; })
	(fetchNuGet { pname = "System.ComponentModel.Annotations"; version = "5.0.0"; hash = "sha256-0pST1UHgpeE6xJrYf5R+U7AwIlH3rVC3SpguilI/MAg="; })
	(fetchNuGet { pname = "System.Diagnostics.Debug"; version = "4.3.0"; hash = "sha256-fkA79SjPbSeiEcrbbUsb70u9B7wqbsdM9s1LnoKj0gM="; })
	(fetchNuGet { pname = "System.Diagnostics.DiagnosticSource"; version = "4.3.0"; hash = "sha256-OFJRb0ygep0Z3yDBLwAgM/Tkfs4JCDtsNhwDH9cd1Xw="; })
	(fetchNuGet { pname = "System.Diagnostics.Tracing"; version = "4.3.0"; hash = "sha256-hCETZpHHGVhPYvb4C0fh4zs+8zv4GPoixagkLZjpa9Q="; })
	(fetchNuGet { pname = "System.Globalization"; version = "4.3.0"; hash = "sha256-caL0pRmFSEsaoeZeWN5BTQtGrAtaQPwFi8YOZPZG5rI="; })
	(fetchNuGet { pname = "System.Globalization.Calendars"; version = "4.3.0"; hash = "sha256-uNOD0EOVFgnS2fMKvMiEtI9aOw00+Pfy/H+qucAQlPc="; })
	(fetchNuGet { pname = "System.Globalization.Extensions"; version = "4.3.0"; hash = "sha256-mmJWA27T0GRVuFP9/sj+4TrR4GJWrzNIk2PDrbr7RQk="; })
	(fetchNuGet { pname = "System.IO"; version = "4.3.0"; hash = "sha256-ruynQHekFP5wPrDiVyhNiRIXeZ/I9NpjK5pU+HPDiRY="; })
	(fetchNuGet { pname = "System.IO.FileSystem"; version = "4.3.0"; hash = "sha256-vNIYnvlayuVj0WfRfYKpDrhDptlhp1pN8CYmlVd2TXw="; })
	(fetchNuGet { pname = "System.IO.FileSystem.Primitives"; version = "4.3.0"; hash = "sha256-LMnfg8Vwavs9cMnq9nNH8IWtAtSfk0/Fy4s4Rt9r1kg="; })
	(fetchNuGet { pname = "System.IO.Pipelines"; version = "4.7.2"; hash = "sha256-yWlQwmzMX+4kVQbOd9WowP6bvZnjo4yddkycer3CZJs="; })
	(fetchNuGet { pname = "System.Linq"; version = "4.3.0"; hash = "sha256-R5uiSL3l6a3XrXSSL6jz+q/PcyVQzEAByiuXZNSqD/A="; })
	(fetchNuGet { pname = "System.Memory"; version = "4.5.4"; hash = "sha256-3sCEfzO4gj5CYGctl9ZXQRRhwAraMQfse7yzKoRe65E="; })
	(fetchNuGet { pname = "System.Net.Http"; version = "4.3.4"; hash = "sha256-FMoU0K7nlPLxoDju0NL21Wjlga9GpnAoQjsFhFYYt00="; })
	(fetchNuGet { pname = "System.Net.Primitives"; version = "4.3.0"; hash = "sha256-MY7Z6vOtFMbEKaLW9nOSZeAjcWpwCtdO7/W1mkGZBzE="; })
	(fetchNuGet { pname = "System.Net.WebSockets"; version = "4.3.0"; hash = "sha256-l3h3cF1cCC9zMhWLKSDnZBZvFADUd0Afe2+iAwBA0r0="; })
	(fetchNuGet { pname = "System.Private.Uri"; version = "4.3.0"; hash = "sha256-fVfgcoP4AVN1E5wHZbKBIOPYZ/xBeSIdsNF+bdukIRM="; })
	(fetchNuGet { pname = "System.Reflection"; version = "4.3.0"; hash = "sha256-NQSZRpZLvtPWDlvmMIdGxcVuyUnw92ZURo0hXsEshXY="; })
	(fetchNuGet { pname = "System.Reflection.Emit"; version = "4.7.0"; hash = "sha256-Fw/CSRD+wajH1MqfKS3Q/sIrUH7GN4K+F+Dx68UPNIg="; })
	(fetchNuGet { pname = "System.Reflection.Emit.Lightweight"; version = "4.6.0"; hash = "sha256-913OIkt3v3N12Yke328IRxTtgYUQYNs/eSzOs8wUPkM="; })
	(fetchNuGet { pname = "System.Reflection.Primitives"; version = "4.3.0"; hash = "sha256-5ogwWB4vlQTl3jjk1xjniG2ozbFIjZTL9ug0usZQuBM="; })
	(fetchNuGet { pname = "System.Resources.ResourceManager"; version = "4.3.0"; hash = "sha256-idiOD93xbbrbwwSnD4mORA9RYi/D/U48eRUsn/WnWGo="; })
	(fetchNuGet { pname = "System.Runtime"; version = "4.3.0"; hash = "sha256-51813WXpBIsuA6fUtE5XaRQjcWdQ2/lmEokJt97u0Rg="; })
	(fetchNuGet { pname = "System.Runtime.CompilerServices.Unsafe"; version = "4.5.2"; hash = "sha256-8eUXXGWO2LL7uATMZye2iCpQOETn2jCcjUhG6coR5O8="; })
	(fetchNuGet { pname = "System.Runtime.CompilerServices.Unsafe"; version = "4.7.1"; hash = "sha256-UvyoDV8O0oY3HPG1GbA56YVdvwTGEfjYR5gW1O7IK4U="; })
	(fetchNuGet { pname = "System.Runtime.CompilerServices.Unsafe"; version = "6.0.0-rc.1.21451.13"; hash = "sha256-BgiqR6Y555tJEBEqDT5+yHCyQy5Wv9bLKlKWcQFiq2w="; })
	(fetchNuGet { pname = "System.Runtime.Extensions"; version = "4.3.0"; hash = "sha256-wLDHmozr84v1W2zYCWYxxj0FR0JDYHSVRaRuDm0bd/o="; })
	(fetchNuGet { pname = "System.Runtime.Handles"; version = "4.3.0"; hash = "sha256-KJ5aXoGpB56Y6+iepBkdpx/AfaJDAitx4vrkLqR7gms="; })
	(fetchNuGet { pname = "System.Runtime.InteropServices"; version = "4.3.0"; hash = "sha256-8sDH+WUJfCR+7e4nfpftj/+lstEiZixWUBueR2zmHgI="; })
	(fetchNuGet { pname = "System.Runtime.Numerics"; version = "4.3.0"; hash = "sha256-P5jHCgMbgFMYiONvzmaKFeOqcAIDPu/U8bOVrNPYKqc="; })
	(fetchNuGet { pname = "System.Security.AccessControl"; version = "4.6.0"; hash = "sha256-rspJ63MbjNVDve0owXby0Pu2vHjQvR2uuhCDCJ9vgfI="; })
	(fetchNuGet { pname = "System.Security.Cryptography.Algorithms"; version = "4.3.0"; hash = "sha256-tAJvNSlczYBJ3Ed24Ae27a55tq/n4D3fubNQdwcKWA8="; })
	(fetchNuGet { pname = "System.Security.Cryptography.Cng"; version = "4.3.0"; hash = "sha256-u17vy6wNhqok91SrVLno2M1EzLHZm6VMca85xbVChsw="; })
	(fetchNuGet { pname = "System.Security.Cryptography.Csp"; version = "4.3.0"; hash = "sha256-oefdTU/Z2PWU9nlat8uiRDGq/PGZoSPRgkML11pmvPQ="; })
	(fetchNuGet { pname = "System.Security.Cryptography.Encoding"; version = "4.3.0"; hash = "sha256-Yuge89N6M+NcblcvXMeyHZ6kZDfwBv3LPMDiF8HhJss="; })
	(fetchNuGet { pname = "System.Security.Cryptography.OpenSsl"; version = "4.3.0"; hash = "sha256-DL+D2sc2JrQiB4oAcUggTFyD8w3aLEjJfod5JPe+Oz4="; })
	(fetchNuGet { pname = "System.Security.Cryptography.Primitives"; version = "4.3.0"; hash = "sha256-fnFi7B3SnVj5a+BbgXnbjnGNvWrCEU6Hp/wjsjWz318="; })
	(fetchNuGet { pname = "System.Security.Cryptography.X509Certificates"; version = "4.3.0"; hash = "sha256-MG3V/owDh273GCUPsGGraNwaVpcydupl3EtPXj6TVG0="; })
	(fetchNuGet { pname = "System.Security.Principal.Windows"; version = "4.6.0"; hash = "sha256-lZeXm45RboVgqnPQVJ65y8b5b+9FSVr0MBciG777rso="; })
	(fetchNuGet { pname = "System.Text.Encoding"; version = "4.3.0"; hash = "sha256-GctHVGLZAa/rqkBNhsBGnsiWdKyv6VDubYpGkuOkBLg="; })
	(fetchNuGet { pname = "System.Text.Encoding.Extensions"; version = "4.3.0"; hash = "sha256-vufHXg8QAKxHlujPHHcrtGwAqFmsCD6HKjfDAiHyAYc="; })
	(fetchNuGet { pname = "System.Threading"; version = "4.3.0"; hash = "sha256-ZDQ3dR4pzVwmaqBg4hacZaVenQ/3yAF/uV7BXZXjiWc="; })
	(fetchNuGet { pname = "System.Threading.Tasks"; version = "4.3.0"; hash = "sha256-Z5rXfJ1EXp3G32IKZGiZ6koMjRu0n8C1NGrwpdIen4w="; })
	(fetchNuGet { pname = "System.Threading.Tasks.Dataflow"; version = "4.11.1"; hash = "sha256-fIt5XouNaswWOvZWpIHbTItVzUJDCmz3XawHr6J2yyU="; })
	(fetchNuGet { pname = "System.Threading.Tasks.Extensions"; version = "4.5.4"; hash = "sha256-owSpY8wHlsUXn5xrfYAiu847L6fAKethlvYx97Ri1ng="; })
	(fetchNuGet { pname = "WaylandNET"; version = "0.2.0"; hash = "sha256-E2VXvSV4KkTz1tQgGXJpuvRQiPlVvSAJb7htBFTeV+I="; })
]
