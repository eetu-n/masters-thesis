{ pkgs ? import <nixpkgs> {} }:

let
  tex = pkgs.texliveMedium.withPackages (ps: with ps; [
    # Provides chngcntr, xifthen, xstring, csquotes, logreq,
    # doclicense, ccicons, sectsty, xurl, xmpincl, caption, microtype, etc.
    collection-latexextra

    # Creative Commons icon font (needed by doclicense)
    ccicons

    # PDF/A & color profile dependencies
    colorprofiles

    # Fonts used by \setupthesisfonts
    newtx
    fontaxes

    # Hyphenation and babel support for English, Finnish, Swedish
    collection-langeuropean

    # Bibliography engine & automation
    biblatex
    biber
    latexmk
  ]);
in
pkgs.mkShell {
  packages = [
    tex
  ];
}
