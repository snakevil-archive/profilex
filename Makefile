# Makefile
#
# AUTHOR     Snakevil Zen <zsnakevil@gmail.com>
# COPYRIGHT  © 2011 Snakevil.in.

PROFILES = bash_profile bashrc profile vimrc

# {{{ Calculates paths.

PREFIX = $(HOME)
INSTALL_DIR = $(PREFIX)/.local/ProfileX
RC_DIR = $(PREFIX)/.profilexrc

BACKUP_ROOT = $(strip $(addsuffix /backup, $(RC_DIR)))
BACKUP_DIR = $(strip $(addprefix $(BACKUP_ROOT)/, \
		$(shell 'date' +'@%Y-%m-%d.%H:%M:%S.%s') \
	) \
)

BACKUP_PROFILES = $(strip $(foreach profile, $(PROFILES), \
		$(shell if [ -f "$(PREFIX)/.$(strip $(profile))" ]; \
			then \
				'stat' -c'%N' "$(PREFIX)/.$(strip $(profile))" \
					| 'awk' ' \
						BEGIN { \
							FS=" -> `"; \
						} \
						".local/ProfileX/etc/$(strip $(profile))'"'"'"!=$$2{ \
							print "$(strip $(profile))"; \
						}'; \
			fi \
		) \
	) \
)

BACKUP_MKDIR = $(strip $(if $(BACKUP_PROFILES), $(BACKUP_DIR), $(BACKUP_ROOT)))

RESTORE_DIR = $(strip $(lastword $(sort $(foreach backup, \
				$(wildcard $(addsuffix /@*, $(BACKUP_ROOT))), \
				$(shell [ -d "$(backup)" ] && 'echo' "$(backup)" ) \
			) \
		) \
	) \
)

RESTORE_PROFILES = $(strip $(if $(RESTORE_DIR), \
	$(foreach profile, \
			$(wildcard $(addprefix $(strip $(RESTORE_DIR))/, $(PROFILES))), \
			$(notdir $(profile)) \
		) \
	) \
)

# }}}

ProfileX:

# {{{ Rule on target: install

install: ProfileX
	if [ ! -d "$(BACKUP_MKDIR)" ]; \
	then \
		'mkdir' -p "$(BACKUP_MKDIR)"; \
	fi;
	for file in $(BACKUP_PROFILES); \
	do \
		'mv' -f "$(PREFIX)/.$${file}" "$(BACKUP_DIR)/$${file}"; \
	done;
	for file in $(PROFILES); \
	do \
		if [ -e "$(PREFIX)/.$${file}" -o -L "$(PREFIX)/.$${file}" ]; \
		then \
			$(RM) -R "$(PREFIX)/.$${file}"; \
		fi; \
		'ln' -s ".local/ProfileX/etc/$${file}" "$(PREFIX)/.$${file}"; \
	done;
	if [ ! -d "$(dir $(INSTALL_DIR))" ]; \
	then \
		'mkdir' -p "$(dir $(INSTALL_DIR))"; \
	elif [ -e "$(INSTALL_DIR)" ]; \
	then \
		$(RM) -R "$(INSTALL_DIR)"; \
	fi;
	'ln' -s "$(strip $(abspath src))" "$(INSTALL_DIR)";

# }}}

# {{{ Rule on target: uninstall

uninstall: ProfileX
	for file in $(PROFILES); \
	do \
		if [ -f "$(PREFIX)/.$${file}" -o -L "$(PREFIX)/.$${file}" ]; \
		then \
			$(RM) "$(PREFIX)/.$${file}"; \
		fi; \
	done;
	for file in $(RESTORE_PROFILES); \
	do \
		'mv' -f "$(RESTORE_DIR)/$${file}" "$(PREFIX)/.$${file}"; \
	done;
	if [ -d "$(RESTORE_DIR)" ]; \
	then \
		$(RM) -R "$(RESTORE_DIR)"; \
	fi;
	$(RM) -R "$(INSTALL_DIR)";

# }}}

.PHONY: install uninstall

# vim:ft=make:fenc=utf-8:ff=unix:tw=120:ts=4:sts=4:noet:ai:si
# vim:nowrap:sw=4:nu:nuw=4:so=5:fen:fdm=marker
