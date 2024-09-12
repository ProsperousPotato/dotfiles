#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {

    const char *curl_kernel_version = "curl -s https://www.kernel.org/releases.json | jq -r '.releases[] | select(.moniker == \"mainline\" ) | .version' | sed -E 's/^([0-9]+\\.[0-9]+)([^0-9]|$)/\\1.0\\2/'";
    const char *curl_current_kernel = "uname -r | sed 's/-[^-]*$//'";
    const char *curl_kernel_date = "curl -s https://www.kernel.org/releases.json | jq -r '.releases[] | select(.moniker == \"mainline\" ) | .released.isodate'";
    const char *curl_kernel_wget = "curl -s https://www.kernel.org/releases.json | jq -r '.releases[] | select(.moniker == \"mainline\" ) | .source'";

    char kernel_version[256];
    char current_kernel[256];
    char kernel_date[256];
    char kernel_wget[256];
    char wget_dir[256];
    char wget_download[1024];
    FILE *command;

    command = popen(curl_kernel_version, "r");

    if (fgets(kernel_version, sizeof(kernel_version), command) != NULL) {
        printf("\033[0;31mNewest mainline kernel: \033[0;34m%s", kernel_version);
    } else {
        printf("Could not find newest mainline kernel. Please check your internet connection.\n");
        exit(1);
    }
    pclose(command);

    command = popen(curl_current_kernel, "r");

    if (fgets(current_kernel, sizeof(current_kernel), command) != NULL) {
        printf("\033[0;31mCurrently running kernel: \033[0;34m%s\n", current_kernel);
    }
    pclose(command);

    command = popen(curl_kernel_date, "r");

    if (fgets(kernel_date, sizeof(kernel_date), command) != NULL) {
        printf("\033[0;31mKernel released: \033[0;34m%s", kernel_date);
    }
    pclose(command);

    command = popen(curl_kernel_wget, "r");

    if (fgets(kernel_wget, sizeof(kernel_wget), command) != NULL) {
        printf("\033[0;31mKernel download address: \033[0;34m%s\033[0m\n", kernel_wget);
    }
    pclose(command);

    char response;

    if (strcmp(current_kernel, kernel_version) == 0) {
        printf("Currently running kernel is up-to-date\n");
    } else {
        printf("A newer mainline kernel is available, would you like to download the newest available kernel? [y/N] ");
        scanf("%c", &response);
        if (response == 'y' || response == 'Y') {
            printf("\nEnter directory for download (\'./\' for current directory): ");
            scanf("%255s", wget_dir);
            snprintf(wget_download, sizeof(wget_download), "wget --directory-prefix=\"%s\" %s", wget_dir, kernel_wget);
            command = popen(wget_download, "r");

            if (command != NULL) {
                printf("Executing command: %s", wget_download);
            }
            pclose(command);
        } else {
            exit(1);
        }
    }
    return 0;
}
