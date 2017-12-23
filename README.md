# AllanWang-Resume

Yet another open source template

This template is heavily based off of [Deedy](https://github.com/deedy/Deedy-Resume)

Huge thanks to him for opening his version, along with the openfonts.

## Preview

<object data="https://www.allanwang.ca/resume.pdf" type="application/pdf" width="700px" height="700px">
    <embed src="https://www.allanwang.ca/resume.pdf">
        This browser does not support PDFs. Please download the PDF to view it: <a href="https://www.allanwang.ca/resume.pdf">Download PDF</a>.</p>
    </embed>
</object>

<!-- ![Preview](https://www.allanwang.ca/resume-snapshot.png) -->

## Dependencies

The template will only compile with *XeTeX*.
It also supports magic comments for [LaTeX Workshop](https://github.com/James-Yu/LaTeX-Workshop) (VS-Code)

## Components

### Header

The header is bundled up with a series of name definitions like so:

```latex
\firstname{First}
\lastname{Last}
\phone{(xxx) xxx-xxxx}
\email{me@website.ca}
\website{website.ca}
\github{GithubUsername}
\header
```

### Statistics

Statistics will highlight the number of downloads, starts, and forks through optional arguments:

```latex
\stats[downloads=66500, stars=26, forks=10]
```

### Projects

Project headers are formatted through three arguments:

The name, the organization, and the date.

```latex
\project{Kotlin Android Utils}{Open Source}{Jun 2017 - Present}
```

### Text Styles

The cls bundles some formatted text styles, including

```latex
\section{Main}
\subsection{Sub}
\descript{Description}
\content{Content}
```

### Links

As an Android developer, I've added some helper functions for linking projects. Namely:

```latex
\githublink{name}{repo}{text}
\mygithub{repo}[text (repo name be default)]
\playstorelink{package}{text}
```

Links are typically formatted as lowercase to avoid conflicts with the upper case text styles.