# qurani-core documentation


This framework propos a better way to organize the structure of holy quran, it aims to provide simple solutions to search, filter, sort, and do all the operations on ranges of ayat.

## Motivation

// TODO: will write it inshallah 😂

## Example

// TODO: will provide it inshallah 😂


## Store And References 
The main thing you'll notice, and you should start with, is Quran itself, which represents the model of holy quran, from there you can access both the reference, and the original ayat.

### Aya
A fundamental model when dealing with quran, it represents a single holy quran aya, with it's index ( relative to the quran, aka. global index ), and text contents.

### QuranReference and other reference types

The Quran reference contains a few bookmarks and helpers that represent the quran, you can imagine them as a projector against the original ordered list of ayat.

Available references:
- Sura
- Juz
- Sajda
- Hizb
- Page
- Ruku
- Manzil

To look at the base model for those references, have a look at the protocol: **AyatRangeModelType**, which would be helpful.

All references has ayat, you can access them eaisly.

## Reading and Writing
First of all, you need to read the ayat, they are stored into an ordered array, you can use on of the readers available:
    - AyatXMLReader ( requires XMLCoder )
    - AyatPlistReader ( preferred )

And for the reference, use the QuranReferenceReader availables, and for now it's only one ( as you can provide your own ):
- QuranReferencePlistReader

and for accessing the defualt readers, use the singletone instance **Quran**, which automaticly loads both the store and the reference.

## A Simple note
- Ofcourse, all objects mentioned earlier are non-mutable :))

## Description Providers
Up to now we have the raw strucure for dealing with holy quran reading, but what if we wanted more advanced use cases?

What if we need to describe a range of ayat that happen to contain 2 surahs in between?

Or we want to sort juzs based on surahs?

For this ( and more more reasons ) , we introduce **AyatRangeDescription**, in which as you can tell from it's name, a simple protocol for describing a range of ayat.

This could be..
- Sura?
- Juz?
- Page?
- Something more Dynamic?
- otherwise?

of-course, a description has it's own title and subtitle, depending on the range of ayat.

Because in the Holy Quran there are many types of descriptions, we have introduced something called **AyatRangeDescriptionProvider**, which provides a descriptions for the holy quran all.

You get a range description from one of the available providers, they are powerful objects that has many features, later added 😷😂
- You get free support for the title and subtitle
- support to return index path for specific aya, and number of sections too.
- makes it easy for you to split the references into suras, pages, ... etc
- Can use mixed type of sections inside one range description

As a starting point, see the **DescriptionProvidersManager**, which provides methods for getting providers for descriptions.

## Wirds
Sometimes we wanna split specific sura or specific range of ayat into "Wirds", in which they are specific amount of ayat, a range has multiple wirds.
Wirds are used in cases of reading and memorizing.

So let's say we have juz' **tabarak** ( juz no. 29 in the holy quran ) , we can tell the wird generator to split this juz into a list of wirds based on suras, so each day we read one sura.

See **WirdGeneratorType**, which provides a base definition for generating wirds for specific ayat rannge.

## Memorization and Bookmarks
 Under work..


## Tests
Under work, that has to include:
- Validation of ayat range description models
- Wird Generation models
- Quran and ayat references


## Notes
qurani-core comes with it's data in mind, for the time being, it only depends on the data provided, external data parsing support may come later, but for a saftey consideration, we'll stick with immutable model for now.

وآخر دعوانا أن الحمدلله رب العالمين ❤️
