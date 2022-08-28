# Official Reduct Storage Homepage

Run locally:

```
docker build -t jekyll .
docker run -p 4000:4000 -v ${PWD}:/src jekyll serve -H 0.0.0.0 -s /src
```