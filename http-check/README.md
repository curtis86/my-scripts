# http-check

Continuously prints out the load time components of a URL (DNS time, TTFB, etc) - useful for observing intermittent issues or just general performance.

### Usage

_Note_: formatting will look much nicer on a wider terminal screen

```
 ./http-check www.google.com
Status  HTTP_Code  Final_URL                       Resolved_IP     Redirect_Count  SSL_Verified  Page_Size  Download_Speed  DNS_Time  Connect_Time  Protocol_Time  TTFB      Redirect_Time  Total_Time  Diff
OK      200        https://www.google.com/?gws_rd  142.250.70.196  1               Y             131.53     208.97          0.017064  0.040740      0.154189       0.580596  0.238062       0.629400    0.629400
OK      200        https://www.google.com/?gws_rd  142.250.70.196  1               Y             131.59     206.40          0.019220  0.046077      0.158719       0.590679  0.239632       0.637571    -0.033393
OK      200        https://www.google.com/?gws_rd  142.250.70.196  1               Y             131.65     198.70          0.016756  0.045343      0.157647       0.587017  0.221402       0.662591    0.025020
OK      200        https://www.google.com/?gws_rd  142.250.70.196  1               Y             131.59     203.81          0.018768  0.045040      0.160011       0.596498  0.246273       0.645680    -0.016911
OK      200        https://www.google.com/?gws_rd  142.250.70.196  1               Y             131.57     172.00          0.018070  0.039731      0.154437       0.714803  0.380533       0.764954    0.119274
```

### Explanation of fields

| Field      | Description |
| ----------- | ----------- |
| Status      | OK or FAIL |
| HTTP_Code   | HTTP Code |
| Final_URL   | Final URL (after following redirects, if any) |
| Resolved_IP   | The resolved IP address used in this request |
| Redirect_Count   | Number of redirects involved |
| SSL_Verified   | SSL certificate is valid |
| Page_Size   | Page size (KB) |
| DNS_Time   | Time taken to resolve DNS (seconds) |
| Download_Speed   | Average download speed (KB/s) |
| Connect_Time   | Time taken to connect to the host (seconds) |
| Protocol_Time   | Protocol negotiation time (seconds) |
| TTFB   | Time To First Byte received (seconds) |
| Redirect_Time   | Time spent in redirects (seconds) |
| Total_Time   | Total time for the request to complete (seconds)  |
| Diff   | Time diff. from previous reading (seconds) |

### Notes

1. Update `checkDelay` in the script to change to your preferred check interval (default is 3 seconds)
2. HTTP response codes that != 200 are still considered valid, a `FAIL` status will only occur if we are unable to retreive the remote URL at all.