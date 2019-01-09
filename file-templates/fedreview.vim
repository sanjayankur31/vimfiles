[+] OK
[-] NA
[?] Issue

** Mandatory review guidelines: **
 [ ] rpmlint output:
   ...
 [ ] License is acceptable (...)
 [ ] License field in spec is correct
 [ ] License files included in package %docs if included in source package
 [ ] License files installed when any subpackage combination is installed
 [ ] Spec written in American English
 [ ] Spec is legible
 [ ] Sources match upstream unless altered to fix permissibility issues
   Upstream SHA256: ...
   Your SHA256:     ...
 [ ] Build succeeds on at least one primary arch
 [ ] Build succeeds on all primary arches or has ExcludeArch + bugs filed
 [ ] BuildRequires correct, justified where necessary
 [ ] Locales handled with %find_lang, not %_datadir/locale/*
 [ ] %post, %postun call ldconfig if package contains shared .so files
 [ ] No bundled libs
 [ ] Relocatability is justified
 [ ] Package owns all directories it creates
 [ ] Package requires others for directories it uses but does not own
 [ ] No duplication in %files unless necessary for license files
 [ ] File permissions are sane
 [ ] Package contains permissible code or content
 [ ] Large docs go in -doc subpackage
 [ ] %doc files not required at runtime
 [ ] Static libs go in -static package/virtual Provides
 [ ] Development files go in -devel package
 [ ] -devel packages Require base with fully-versioned dependency, %_isa
 [ ] No .la files
 [ ] GUI app uses .desktop file, installs it with desktop-file-install
 [ ] File list does not conflict with other packages' without justification
 [ ] File names are valid UTF-8

** Optional review guidelines: **
 [ ] Query upstream about including license files
 [ ] Translations of description, summary
 [ ] Builds in mock
 [ ] Builds on all arches
 [ ] Functions as described (e.g. no crashes)
 [ ] Scriptlets are sane
 [ ] Subpackages require base with fully-versioned dependency if sensible
 [ ] .pc file subpackage placement is sensible
 [ ] No file deps outside of /etc, /bin, /sbin, /usr/bin, /usr/sbin
 [ ] Include man pages if available

Naming guidelines:
 [ ] Package names use only a-zA-Z0-9-._+ subject to restrictions on -._+
 [ ] Package names are sane
 [ ] No naming conflicts
 [ ] Spec file name matches base package name
 [ ] Version is sane
 [ ] Version does not contain ~
 [ ] Release is sane
 [ ] %dist tag
 [ ] Case used only when necessary
 [ ] Renaming handled correctly

Packaging guidelines:
 [ ] Useful without external bits
 [ ] No kmods
 [ ] Pre-built binaries, libs removed in %prep
 [ ] Sources contain only redistributable code or content
 [ ] Spec format is sane
 [ ] Package obeys FHS, except libexecdir, /run, /usr/target
 [ ] No files in /bin, /sbin, /lib* on >= F17
 [ ] Programs run before FS mounting use /run instead of /var/run
 [ ] Binaries in /bin, /sbin do not depend on files in /usr on < F17
 [ ] No files under /srv, /opt, /usr/local
 [ ] Changelog in prescribed format
 [ ] No Packager, Vendor, Copyright, PreReq tags
 [ ] Summary does not end in a period
 [ ] Correct BuildRoot tag on < EL6
 [ ] Correct %clean section on < EL6
 [ ] Requires correct, justified where necessary
 [ ] Summary, description do not use trademarks incorrectly
 [ ] All relevant documentation is packaged, appropriately marked with %doc
 [ ] Doc files do not drag in extra dependencies (e.g. due to +x)
 [ ] Code compilable with gcc is compiled with gcc
 [ ] Build honors applicable compiler flags or justifies otherwise
 [ ] PIE used for long-running/root daemons, setuid/filecap programs
 [ ] Useful -debuginfo package or disabled and justified
 [ ] Package with .pc files Requires pkgconfig on < EL6
 [ ] No static executables
 [ ] Rpath absent or only used for internal libs
 [ ] Config files marked with %config(noreplace) or justified %config
 [ ] No config files under /usr
 [ ] Third party package manager configs acceptable, in %_docdir
 [ ] .desktop files are sane
 [ ] Spec uses macros consistently
 [ ] Spec uses macros instead of hard-coded names where appropriate
 [ ] Spec uses macros for executables only when configurability is needed
 [ ] %makeinstall used only when alternatives don't work
 [ ] Macros in Summary, description are expandable at srpm build time
 [ ] Spec uses %{SOURCE#} instead of $RPM_SOURCE_DIR and %sourcedir
 [ ] No software collections (scl)
 [ ] Macro files named /etc/rpm/macros.%name
 [ ] Build uses only python/perl/shell+coreutils/lua/BuildRequired langs
 [ ] %global, not %define
 [ ] Package translating with gettext BuildRequires it
 [ ] Package translating with Linguist BuildRequires qt-devel
 [ ] File ops preserve timestamps
 [ ] Parallel make
 [ ] No Requires(pre,post) notation
 [ ] User, group creation handled correctly (See Packaging:UsersAndGroups)
 [ ] Web apps go in /usr/share/%name, not /var/www
 [ ] Conflicts are justified
 [ ] One project per package
 [ ] No bundled fonts
 [ ] Patches have appropriate commentary
 [ ] Available test suites executed in %check
 [ ] tmpfiles.d used for /run, /run/lock on >= F15

 ** SysV Init script guidelines: ** 
 [ ] Init scripts go in /etc/rc.d/init.d
 [ ] Init scripts not marked with %config
 [ ] Init script configuration in /etc/sysconfig
 [ ] Init scripts have 0755 permissions
 [ ] Packages with unit files put init scripts in -sysvinit subpackage
 [ ] chkconfig, initscripts Requires, init scripts correct
 [ ] Daemon-spawning init scripts manage /var/lock/subsys/%name
 [ ] Init scripts have chkconfig headers
 [ ] Init script environment variables have reasonable defaults
 [ ] Init scripts implement all required actions
 [ ] Init script behavior is sensible
 [ ] Init script return codes are correct

 ** Systemd guidelines: **
 [ ] Traditional service uses a unit file
 [ ] Non-standard service commands converted to standalone scripts
 [ ] Unit names are sane
 [ ] Description= lines do not exceed 80 characters
 [ ] Documentation field has correct URI format
 [ ] Service Types= are correct
 [ ] Requires=, Wants= used only when necessary
 [ ] Units to not refer to runlevel*.target
 [ ] Symlinks used instead of Name=
 [ ] StandardOutput=, StandardError= used only when necessary
 [ ] Socket-activated service has FESCo approval, correct unit files
 [ ] Unit files go in %_unitdir
 [ ] BuildRequires: systemd-units for %_unitdir macro
 [ ] Packaged unit files are not %config files
 [ ] Unit file scriptlets are correct
 [ ] tmpfiles.d used where needed

 ** Java guidelines: **
 [ ] Javadocs go in javadoc subpackage
 [ ] Prefer split JARs over monolithic
 [ ] JAR file names correct
 [ ] JAR files go in %{_javadir} or %{_javadir}-$version
 [ ] Multiple JAR files go in a %{name} subdirectory
 [ ] Javadocs go in unversioned %{_javadocdir}/%{name}
 [ ] javadoc subpackage is noarch on > EL5
 [ ] BuildRequires java-devel, jpackage-utils
 [ ] Requires java, jpackage-utils
 [ ] Dependencies on java/java-devel >= 1.6.0 add epoch 1
 [ ] Package requiring maven2 Requires jpackage-utils for post and postun
 [ ] Package requiring maven contains correct maven-specific code in spec
 [ ] Wrapper script in %{_bindir}
 [ ] GCJ AOT bits follow GCJ guidelines
 [ ] No devel package
 [ ] pom.xml files, if any, installed with %add_maven_depmap
 [ ] JNI shared objects, JARs that require them go in %{_libdir}/%{name}
 [ ] Calls to System.loadLibrary replaced w/ System.load w/ full .so path
 [ ] Bundled JAR files not included or used for build
 [ ] No Javadoc %post/%ghost
 [ ] No class-path elements in JAR manifests

 ** Perl guidelines: **
 [ ] Module requirements use virtual perl(modname) syntax
 [ ] Spec BuildRequires correct core modules, not perl-devel
 [ ] Spec contains correct MODULE_COMPAT Requires
 [ ] Requires/Provides are sane
 [ ] CPAN URL tag is not versioned
 [ ] All tests enabled where possible
 [ ] Use Build.PL if present unless justified otherwise
 [ ] .h files not split into -devel package

 ** Python guidelines: **
 [ ] Runtime Requires correct
 [ ] Python macros declared on < EL6
 [ ] All .py files packaged with .pyc, .pyo counterparts
 [ ] Includes .egg-info files/directories when generated
 [ ] Provides/Requires properly filtered
 [ ] Code that invokes gtk.gdk.get_pixels_array() Requires numpy

