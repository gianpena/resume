# My resume

For any tailoring to specific companies/postings, separate branches should be made and pushed to.

# Compilation
First you need to export some environment variables:
- `PHONE_NUMBER`
- `EMAIL`
The GitHub and LinkedIn links are embedded directly into the PDF, there are no variables for them. You will have to modify these yourself.

You will also need the fontawesome fonts. Sorry that I can't give more guidance here, it's a process that in my opinion is too lengthy for a README.

Then you need to run:
```sh
make
```
which will create `resume.pdf` and `unredacted.pdf`.
