# cert-recon

Retrieves all certificates issued for a particular domain name from public certificate transparency logs, using https://crt.sh/

## Usage

`cert-recon [-d domain]`

## Example

```
/cert-recon.sh -d example.com
Got 9 certs:
1. *.example.com
2. dev.example.com
3. example.com
4. m.example.com
5. m.testexample.com
6. products.example.com
7. subjectname@example.com
8. support.example.com
9. www.example.com
```
