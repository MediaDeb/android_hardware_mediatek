#ifndef PORTABILITY_H
#define PORTABILITY_H

/*
    This hack allows us to compile things with minimum modifications
 */

#define PROPERTY_VALUE_MAX 4096
#define ALOGI(fmt, ...) printf(fmt, ##__VA_ARGS__)
#define ALOGE(fmt, ...) fprintf(stderr, "ERR: %s\n", ##__VA_ARGS__);

static inline int property_get(const char *key, char *value, const char *default_value)
{
    int len = 0;
    if(default_value) {
        len = strlen(default_value);
        memcpy(value, default_value, len + 1);
    }
    return len;
}

static inline int property_set(const char *key, const char *value)
{
    return 0;
}

#endif /* end of include guard: PORTABILITY_H */
