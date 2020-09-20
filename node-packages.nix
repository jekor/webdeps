# This file has been generated by node2nix 1.8.0. Do not edit!

{nodeEnv, fetchurl, fetchgit, globalBuildInputs ? []}:

let
  sources = {
    "@types/docopt-0.6.31" = {
      name = "_at_types_slash_docopt";
      packageName = "@types/docopt";
      version = "0.6.31";
      src = fetchurl {
        url = "https://registry.npmjs.org/@types/docopt/-/docopt-0.6.31.tgz";
        sha512 = "GvX4PhD2u/JV+BmPFXfR8F3cez8cV7WdlTzLA0gB/ckYMMmI2voIKdW3CoKC7dj1K08YC8/M5oACLj410A96fQ==";
      };
    };
    "@types/node-14.11.1" = {
      name = "_at_types_slash_node";
      packageName = "@types/node";
      version = "14.11.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/@types/node/-/node-14.11.1.tgz";
        sha512 = "oTQgnd0hblfLsJ6BvJzzSL+Inogp3lq9fGgqRkMB/ziKMgEUaFl801OncOzUmalfzt14N0oPHMK47ipl+wbTIw==";
      };
    };
    "arg-4.1.3" = {
      name = "arg";
      packageName = "arg";
      version = "4.1.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/arg/-/arg-4.1.3.tgz";
        sha512 = "58S9QDqG0Xx27YwPSt9fJxivjYl432YCwfDMfZ+71RAqUrZef7LrKQZ3LHLOwCS4FLNBplP533Zx895SeOCHvA==";
      };
    };
    "buffer-from-1.1.1" = {
      name = "buffer-from";
      packageName = "buffer-from";
      version = "1.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/buffer-from/-/buffer-from-1.1.1.tgz";
        sha512 = "MQcXEUbCKtEo7bhqEs6560Hyd4XaovZlO/k9V3hjVUF/zwW7KBVdSK4gIt/bzwS9MbR5qob+F5jusZsb0YQK2A==";
      };
    };
    "colorette-1.2.1" = {
      name = "colorette";
      packageName = "colorette";
      version = "1.2.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/colorette/-/colorette-1.2.1.tgz";
        sha512 = "puCDz0CzydiSYOrnXpz/PKd69zRrribezjtE9yd4zvytoRc8+RY/KJPvtPFKZS3E3wP6neGyMe0vOTlHO5L3Pw==";
      };
    };
    "diff-4.0.2" = {
      name = "diff";
      packageName = "diff";
      version = "4.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/diff/-/diff-4.0.2.tgz";
        sha512 = "58lmxKSA4BNyLz+HHMUzlOEpg09FV+ev6ZMe3vJihgdxzgcwZ8VoEEPmALCZG9LmqfVoNMMKpttIYTVG6uDY7A==";
      };
    };
    "docopt-0.6.2" = {
      name = "docopt";
      packageName = "docopt";
      version = "0.6.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/docopt/-/docopt-0.6.2.tgz";
        sha1 = "b28e9e2220da5ec49f7ea5bb24a47787405eeb11";
      };
    };
    "escape-string-regexp-4.0.0" = {
      name = "escape-string-regexp";
      packageName = "escape-string-regexp";
      version = "4.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp-4.0.0.tgz";
        sha512 = "TtpcNJ3XAzx3Gq8sWRzJaVajRs0uVxA2YAkdb1jm2YkPz4G6egUFAyA3n5vtEIZefPk5Wa4UXbKuS5fKkJWdgA==";
      };
    };
    "isarray-1.0.0" = {
      name = "isarray";
      packageName = "isarray";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/isarray/-/isarray-1.0.0.tgz";
        sha1 = "bb935d48582cba168c06834957a54a3e07124f11";
      };
    };
    "isobject-2.1.0" = {
      name = "isobject";
      packageName = "isobject";
      version = "2.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/isobject/-/isobject-2.1.0.tgz";
        sha1 = "f065561096a3f1da2ef46272f815c840d87e0c89";
      };
    };
    "line-column-1.0.2" = {
      name = "line-column";
      packageName = "line-column";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/line-column/-/line-column-1.0.2.tgz";
        sha1 = "d25af2936b6f4849172b312e4792d1d987bc34a2";
      };
    };
    "make-error-1.3.6" = {
      name = "make-error";
      packageName = "make-error";
      version = "1.3.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/make-error/-/make-error-1.3.6.tgz";
        sha512 = "s8UhlNe7vPKomQhC1qFelMokr/Sc3AgNbso3n74mVPA5LTZwkB9NlXf4XPamLxJE8h0gh73rM94xvwRT2CVInw==";
      };
    };
    "nanoid-3.1.12" = {
      name = "nanoid";
      packageName = "nanoid";
      version = "3.1.12";
      src = fetchurl {
        url = "https://registry.npmjs.org/nanoid/-/nanoid-3.1.12.tgz";
        sha512 = "1qstj9z5+x491jfiC4Nelk+f8XBad7LN20PmyWINJEMRSf3wcAjAWysw1qaA8z6NSKe2sjq1hRSDpBH5paCb6A==";
      };
    };
    "postcss-8.0.5" = {
      name = "postcss";
      packageName = "postcss";
      version = "8.0.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/postcss/-/postcss-8.0.5.tgz";
        sha512 = "3rDm6KR0jHstte3aL3ugrCyFA1UXY90SWNwRZ2WTmRf/QpOqM35mm0FrRR+HHZQ5fY9+nXFat1nl2ekYJf0P4w==";
      };
    };
    "postcss-value-parser-4.1.0" = {
      name = "postcss-value-parser";
      packageName = "postcss-value-parser";
      version = "4.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/postcss-value-parser/-/postcss-value-parser-4.1.0.tgz";
        sha512 = "97DXOFbQJhk71ne5/Mt6cOu6yxsSfM0QGQyl0L25Gca4yGWEGJaig7l7gbCX623VqTBNGLRLaVUCnNkcedlRSQ==";
      };
    };
    "source-map-0.6.1" = {
      name = "source-map";
      packageName = "source-map";
      version = "0.6.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/source-map/-/source-map-0.6.1.tgz";
        sha512 = "UjgapumWlbMhkBgzT7Ykc5YXUT46F0iKu8SGXq0bcwP5dz/h0Plj6enJqjz1Zbq2l5WaqYnrVbwWOWMyF3F47g==";
      };
    };
    "source-map-support-0.5.19" = {
      name = "source-map-support";
      packageName = "source-map-support";
      version = "0.5.19";
      src = fetchurl {
        url = "https://registry.npmjs.org/source-map-support/-/source-map-support-0.5.19.tgz";
        sha512 = "Wonm7zOCIJzBGQdB+thsPar0kYuCIzYvxZwlBa87yi/Mdjv7Tip2cyVbLj5o0cFPN4EVkuTwb3GDDyUx2DGnGw==";
      };
    };
    "ts-node-9.0.0" = {
      name = "ts-node";
      packageName = "ts-node";
      version = "9.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/ts-node/-/ts-node-9.0.0.tgz";
        sha512 = "/TqB4SnererCDR/vb4S/QvSZvzQMJN8daAslg7MeaiHvD8rDZsSfXmNeNumyZZzMned72Xoq/isQljYSt8Ynfg==";
      };
    };
    "typescript-4.0.2" = {
      name = "typescript";
      packageName = "typescript";
      version = "4.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/typescript/-/typescript-4.0.2.tgz";
        sha512 = "e4ERvRV2wb+rRZ/IQeb3jm2VxBsirQLpQhdxplZ2MEzGvDkkMmPglecnNDfSUBivMjP93vRbngYYDQqQ/78bcQ==";
      };
    };
    "yn-3.1.1" = {
      name = "yn";
      packageName = "yn";
      version = "3.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/yn/-/yn-3.1.1.tgz";
        sha512 = "Ux4ygGWsu2c7isFWe8Yu1YluJmqVhxqK2cLXNQA5AcC3QfbGNpM7fu0Y8b/z16pXLnFxZYvWhd3fhBY9DLmC6Q==";
      };
    };
  };
  args = {
    name = "webdeps";
    packageName = "webdeps";
    version = "0.1.0";
    src = ./.;
    dependencies = [
      sources."@types/docopt-0.6.31"
      sources."@types/node-14.11.1"
      sources."arg-4.1.3"
      sources."buffer-from-1.1.1"
      sources."colorette-1.2.1"
      sources."diff-4.0.2"
      sources."docopt-0.6.2"
      sources."escape-string-regexp-4.0.0"
      sources."isarray-1.0.0"
      sources."isobject-2.1.0"
      sources."line-column-1.0.2"
      sources."make-error-1.3.6"
      sources."nanoid-3.1.12"
      sources."postcss-8.0.5"
      sources."postcss-value-parser-4.1.0"
      sources."source-map-0.6.1"
      sources."source-map-support-0.5.19"
      sources."ts-node-9.0.0"
      sources."typescript-4.0.2"
      sources."yn-3.1.1"
    ];
    buildInputs = globalBuildInputs;
    meta = {
      description = "list and manipulate dependencies in JavaScript and CSS files";
      license = "MIT";
    };
    production = false;
    bypassCache = true;
    reconstructLock = false;
  };
in
{
  args = args;
  sources = sources;
  tarball = nodeEnv.buildNodeSourceDist args;
  package = nodeEnv.buildNodePackage args;
  shell = nodeEnv.buildNodeShell args;
}