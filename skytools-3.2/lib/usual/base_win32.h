/*
 * Random win32 compat.
 * 
 * Copyright (c) 2007-2009  Marko Kreen, Skype Technologies OÜ
 * 
 * Permission to use, copy, modify, and/or distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

#ifndef _USUAL_BASE_WIN32_H_
#define _USUAL_BASE_WIN32_H_

#include <windows.h>

#define ECONNABORTED WSAECONNABORTED
#define EMSGSIZE WSAEMSGSIZE
#define EINPROGRESS WSAEWOULDBLOCK // WSAEINPROGRESS

#undef EAGAIN
#define EAGAIN WSAEWOULDBLOCK // WSAEAGAIN

#ifndef EAFNOSUPPORT
#define EAFNOSUPPORT ENOSYS
#endif

/* dummy types / functions */
#define hstrerror strerror
#define getuid() (6667)
#define setsid() getpid()
#define setgid(x) (-1)
#define setuid(x) (-1)
#define fork() (-1)
#define geteuid() getuid()
#define setgroups(s, p) (-1)
#define chown(f, u, g) (-1)

#define srandom(s) srand(s)
#define random() rand()


/* getrlimit() */
#define RLIMIT_NOFILE -1
struct rlimit {
	int rlim_cur;
	int rlim_max;
};
static inline int getrlimit(int res, struct rlimit *dst)
{
	dst->rlim_cur = dst->rlim_max = -1;
	return 0;
}

/* dummy getpwnam() */
struct passwd {
	char *pw_name;
	char *pw_passwd;
	uid_t pw_uid;
	pid_t pw_gid;
	char *pw_gecos;
	char *pw_dir;
	char *pw_shell;
};
static inline struct passwd *getpwnam(const char *u) { return NULL; }
static inline struct passwd *getpwuid(uid_t uid) { return NULL; }

/* dummy getgrnam() */
struct group {
	char *gr_name;
	char *gr_passwd;
	gid_t gr_gid;
	char **gr_mem;
};
static inline struct group *getgrnam(const char *g) { return NULL; }
static inline struct group *getgrgid(gid_t gid) { return NULL; }

/*
 * Minimal dlopen, dlsym, dlclose, dlerror compat.
 */

#define RTLD_LAZY 1
#define RTLD_NOW  2

static inline void *dlopen(const char *fn, int flag)
{
	HMODULE h = LoadLibraryEx(fn, NULL, 0);
	return h;
}

static inline void *dlsym(void *hptr, const char *fname)
{
	HMODULE h = hptr;
	FARPROC f = GetProcAddress(h, fname);
	return f;
}

static inline int dlclose(void *hptr)
{
	HMODULE h = hptr;
	return FreeLibrary(h) ? 0 : -1;
}

static inline const char *dlerror(void)
{
	return strerror(GetLastError());
}

#endif
