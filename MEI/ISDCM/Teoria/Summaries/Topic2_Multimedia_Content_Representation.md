# Topic 2: Multimedia Content Representation

**Teacher:** Jaime Delgado, DAC - UPC
**Semester:** 2024/25 Q2
**Course Code:** ISDCM - Topic 2

---

## 1. Multimedia Content Life-cycle

### 1.1 **Stages**
  - **Creation**: The initial phase where multimedia content is generated.
  - **Storage**: The process of saving multimedia content for future use.
  - **Processing**:
    - **Use**: Involves CRUD operations (**C**reate, **R**ead, **U**pdate, **D**elete).
      - **Read**: Accessing and rendering content (e.g., play, reproduce).
      - **Update**: Transforming, combining, or manipulating content.
  - **Distribution**: Sharing or delivering multimedia content to users or systems.
  - (**Preservation**): Maintaining content over time (altought it may also apply to digital content, is less relevant).
  - **Deletion**: Removing multimedia content when no longer needed.

### 1.2 **Elements Relevant Throughout the Life-cycle**:

| Concept | Description |
|-------|---------------|
| **Identification** | Assigning unique identifiers to content. |
| **Description (Metadata)** | Data describing the content (e.g., title, author). |
| **Coding** | Encoding content into specific formats. |
| **Transfer (Comm. protocols)** | Moving content using communication protocols. |
| **Search** | Mechanisms to locate content.                    |
| **Business Models** | Strategies for monetizing or managing content. |
| **Digital Rights Management** | Protecting content usage rights. |
| **Information (Formats: Metadata + Resources)** | Combining metadata with actual content. |
| **Protocols (Dialogue, Operations)** | Rules for interaction and operations on content. |


## 2. Content Architectures
- **Monomedia** vs. **Multimedia**:
  - **Monomedia**: Single-type content (e.g., text or audio alone).
  - **Multimedia**: Combination of multiple content types (e.g., video -> audio + image).
### 2.1 **Content Type Classification Methods**
  - **Simple Classification**: 
    - **Characters**
    - **Audio**
    - **Image**
    - **Video**
  - **Other Content Types**:
    - 3D
    - Computational data / Databases / Application-specific information ("Applications")
    - Scalar numbers
    - Bio-signals
    - Games, virtual/augmented reality
    - Software, e-books, document formats
    - Structures and containers
  - **MIME Content Types**: Standardized types for internet use, an alternative approach:
    | | |
    |-------------|-------------|
    | Application | Message |
    | Audio       | Model |
    | Example     | Multipart |
    | Font        | Text |
    | Haptics     | Video |
    | Image       | |

  - **Captured/Scanned vs. Synthetized**: Content can be recorded from reality or artificially generated.
    |Captured/Scanned|Syntetized      |
    |----------------|----------------|
    |Photo           |Vectorized Image|
  - **Dimensions**: Space, time, etc., defining content structure.
    |1D|2D|3D|4D|
    |--|--|--|--|
    |audio|image|video|3D video|
    > **audio**: has only time (1D)
    > **image**: has x and y pixels (2D)
    > **video**: has x and y pixels per image, and multiple images on time so (3D)
    > **3D video**: has x and y and z per image, and multiple images on time so (4D)
  - **Human Senses**: Hearing, vision, etc., targeted by content.

## 3. Content Types
### 3.1 Characters
#### 3.1.1 Characters vs Text

  <table>
    <tr>
      <th>Characters</th>
      <th>Text (--> Documents)</th>
    </tr>
    <tr>
      <td>Monomedia</td>
      <td>Multimedia</td>
    </tr>
    <tr>
      <td>Plain text</td>
      <td>
        <table>
          <tr>
            <td>Plain (.txt)</td>
            <td>Rich (.html)</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td>No structure</td>
      <td>Logical and physical (layout) structure presentation</td>
    </tr>
  </table>

#### 3.1.2 Character encodings

- **Visualization**: Use of fonts and graphical rendering.
- **Character Sets**:
  - ASCII → ISO 646: Early standard character encodings.
  - ISO 2022: Variable-width encoding (7-8 bit bytes) with escape characters.
  - ISO/IEC 8859: 8-bit encodings for various charsets (e.g., Latin, Arabic, Hebrew).
  - **UCS (Universal Character Set)**: ISO/IEC 10646, aligned with **Unicode**.
  - **UTF-x**: Encoding schemes (UTF-7, UTF-8, UTF-16, UTF-32).

#### 3.1.3 **Unicode**

| Term | Description |
|------|------------ |
| Character | Symbol that appears in a text. |
| Unicode character | Abstract entity (e.g., *LATIN CAPITAL LETTER A*, *HIRAGANA LETTER SA*). |
| Glyph | Graphical representation of characters (e.g., one glyph may represent multiple characters). |

- **Code Units**: Code units have fixed length, (1 byte in UTF-8, 2 bytes in UTF-16, ...) and **one or more code units may be required to denote a code point**.
- **Code Points**: Unique numbers assigned to every character (0 to 1,114,112), with 0-127 matching ASCII.

<table>
  <tr>
    <th>Feature</th>
    <th><strong>UTF-8</strong></th>
    <th><strong>UTF-16</strong></th>
    <th><strong>UTF-32</strong></th>
  </tr>
  <tr>
    <td><strong>Code Unit</strong></td>
    <td>1 byte</td>
    <td>2 bytes</td>
    <td>4 bytes</td>
  </tr>
  <tr>
    <td><strong>Code Point Size</strong></td>
    <td>1-4 code units</td>
    <td>Code points below 65536 are in a single code unit</td>
    <td rowspan="6">Not used extensively</td>
  </tr>
  <tr>
    <td><strong>Code Point Representation</strong></td>
    <td>Units between 0-127 directly represent corresponding points</td>
    <td>Uses surrogates for higher code points.</td>
  </tr>
  <tr>
    <td><strong>First Code Unit</strong></td>
    <td>- 110xxxxx: indicates 2 code units <br> - 1110xxxx: indicates 3 code units <br> - 11110xxx: indicates 4 code units</td>
    <td>- 110110xxxxxxxxxx</td>
  </tr>
  <tr>
    <td><strong>Second Code Unit</strong></td>
    <td>N/A</td>
    <td>- 110111xxxxxxxxxx</td>
  </tr>
  <tr>
    <td><strong>Remaining Code Units</strong></td>
    <td>10xxxxxx</td>
    <td>N/A</td>
  </tr>
  <tr>
    <td><strong>Example</strong></td>
    <td>- HIRAGANA LETTER SA: 12373 <br> - UTF-8: <strong>1110</strong>0011 <strong>10</strong>000001 <strong>10</strong>010101</td>
    <td>- HIRAGANA LETTER SA: 12373 <br> - UTF-16: 00110000 01010101</td>
  </tr>
</table>


#### 3.1.4 **Key Concepts**
  - All unicode standards are **not** as efficient as ASCII in space terms for ASCII characters.
  - **UTF-8 is more efficient** for languages that use **latin alphabet** while **UTF-16 is more efficient** in **character languages like Japanese**.

### 3.2 Audio

- One-dimensional content type (single dimension: time).
- Characteristics:
  - Speech or non-speech with varying frequency ranges.
  - **Natural** (recorded) or **generated**
  - Can be **structured** ("symbols")
  - Various coding and compression formats
- **Coding and Compression Formats**:
  - **Telephony/Speech**:
    - PCM (Pulse Code Modulation): Logarithmic encoding.
    - G.7xx: Series of telephony standards.
    - GSM: Mobile communication audio standard.
  - **Music**:
    - CD-DA (Compact Disc - Digital Audio): Linear PCM, 1,411 Mbps.
    - DVD-Audio: Up to 9,216 Mbps.
    - MIDI (Musical Instrument Digital Interface): Music-specific control format.
  - **Broadcasting/Video**:
    - MPEG-1 Layer III (mp3): Perception-based compression.
    - MPEG-2 AAC (Advanced Audio Coding): Enhanced audio compression.
  - **Open Source (xiph.org Foundation)**:
    - Lossy:
      - Vorbis: Competes with mp3/AAC (introduced 2000).
      - Opus: RFC 6716 (2012), updated RFC 8251 (2017), authored by Mozilla and Skype.
    - Lossless:
      - FLAC (Free Lossless Audio Codec): Introduced 2001.
  - **Vendors**:
    - Lossless:
      - ALAC (Apple Lossless Audio Codec): Introduced 2004, open-sourced 2011.

### 3.3 Images

- Two-dimensional content type (space: width and height).
- **Still Images**:
  - **Captured**/**Scanned** - **Synthesized**

  | **Raster (Pixels, Bitmap)** | **Vector Graphics** |
  | -------------------- | --------------- |
  | Grid of pixels. | Geometric objects (lines, polygons, circles, etc.) |
#### 3.3.1 **Vector Graphics**
  - **Standards**:
    - CGM (Computer Graphics Metafile): ISO/IEC 8632, `image/cgm`.
    - SVG (Scalable Vector Graphics): W3C, XML-based, `image/svg+xml`.
    - SVG 2 (2018), can include raster graphics and JS code.
  - **Proprietary**:
    - Adobe Illustrator: `application/illustrator`.
    - CorelDRAW: `application/coreldraw`.
    - EPS (Encapsulated PostScript): `application/postscript`.
#### 3.3.2 **Raster Image**
- Bits per pixel (**depth**).
- **ISO Standards**:
  - JPEG: ISO/IEC 10918, `image/jpeg` (1992-1994).
  - JPEG2000: ISO/IEC 15444, `image/jpeg2000` (2001-2019).
  - JPEG XR: ISO/IEC 29199, `image/vnd.ms-photo`, `image/jxr` (2009-2020).
  - JPEG XT: ISO/IEC 18477, includes HDR support.
  - JPEG XL: ISO/IEC 18181, improved quality and compression.
- **Professional Use**:
  - DPX: ANSI/SMPTE, `image/dpx`.
  - RAW: raw image formats
  - ISO 12234-2, **TIFF/EP** (2001).
- **Individual Use**:
  - BMP: Microsoft, `image/bmp` (1986).
  - GIF: CompuServe, `image/gif` (1987, patents expired 2003).
  - WebP: Google, `image/webp` (2010, based on VP8).
  - BPG: `image/bpg` (2014).
  - FLIF (Free Lossless Image Format): `image/flif` (2015)
- **File Formats/Containers**:
  - JFIF: JPEG File Interchange Format.
  - PNG:
    - **Donated** to **W3C** ('96)
    - ISO/IEC 15948, `image/png` (2004).
    - **Datastream** & associated file format. `image/png`.
  - TIFF: Adobe v.6 (1992), `image/tiff`.
- **New/Future Formats**:
  - AOMedia vs MPEG
    - AVIF vs HEIF
      - AVIF: AV1 Image File Format. AOMedia
      - HEIF: Image File Format of HEVC. MPEG
  - HEIC: An implementation of HEIF mainly supported by Apple.
  - WebP: Includes a RIFF-based container from Google. Web-oriented.
  - JPEG-XL: ISO/IEC 18181, web-oriented, JPEG-1 compatible.
#### 3.3.3 **Key Concept**:
Image formats originally where complettelly separated from Video formats, but lately it has been found that the encodings made for Videos are better for encoding images.
  - Some Image formats that come from video:
    - **AVIF: Comes from AV1**
    - **HEIF: Comes from HEVC.**
    - **Webp: Comes from VP8**

### 3.4 Video
- Three-dimensional content type (2D space + time).
- Characteristics:
  - **Moving Images** -> Captured
  - **Animation**: Moving vector graphics. -> Synthetized
  - Series of frames (raster images) at a specific frame rate (**24-30 FPS at least**).
  - Requires compression and coding.
  - Includes 3D video.
- **Animation Formats**:
  - SVG2: Supports animation with JavaScript.
  - SMIL (Synchronized Multimedia Integration Language): W3C, for interactive multimedia presentations.
- **Formats**:
  - **Color Representation**: RGB to luma + chroma, subsampling (ITU-R Rec. 601, 1982).
  - **Spatial Compression**:
    - M-JPEG: Motion JPEG.
    - M-JPEG2000: Motion JPEG2000.
  - **Temporal Compression (I-, P-, B-frames)**:
    - MPEG-1: ISO/IEC 11172 (CD-ROM era).
    - MPEG-2: ISO/IEC 13818 / H.262 (DVD era).
    - MPEG-4 Part 2 (Visual): ISO/IEC 14496, object-based.
    - AVC (Advanced Video Coding): MPEG-4 Part 10 / H.264 (web era).
    - HEVC (High Efficiency Video Coding): ISO/IEC 23008-2 / H.265, supports 8K.
    - VVC (Versatile Video Coding): ISO/IEC 23090 / H.266 (MPEG-I Part 3).
  - **Other Standards**:
    - H.261, H.263: For transmission/videoconferencing.
    - VP8: Google (2010), open-source, RFC 6386.
    - VP9 → AV1: Alliance for Open Media, royalty-free.
  - **Future Directions**:
    - MPEG-5 EVC (Essential Video Coding): ISO/IEC 23094-1, licensing-friendly.
    - LCEVC (Low Complexity Enhancement Video Coding): ISO/IEC 23094-2.
    - Emerging: Coding for machines, lenslet video coding.

## 4. Structures and Containers

### 4.1 **Fundamental Concepts**
- **Structures:** Logical and physical organization of multimedia content
- **Containers:** File formats that encapsulate multiple multimedia streams
- **Purpose:** Combine multiple streams with metadata and synchronization information
- **Key Container Elements:** Audio/video streams, synchronization info, metadata, complementary info (subtitles, chapters)

### 4.2 **Major Multimedia Container Standards**
- **QuickTime File Format:** Developed by Apple, basis for MPEG-4 file format
- **MPEG-4 Part 14 (MP4):** ISO/IEC 14496-14, widely used for audio/video
- **Matroska (MKV):** Open-source container with extensive support for multiple streams
- **WebM:** Based on Matroska, optimized for web use (VP8/VP9 + Vorbis/Opus)
- **AVI:** Microsoft's early container format (limited compared to modern formats)
- **3GPP:** Mobile-oriented container format
- **MPEG-TS:** Designed for broadcasting and streaming

### 4.3 **ISO Base Media File Format (ISOBMFF)**
- Standardized as ISO/IEC 14496-12 (6th edition)
- Received Technology & Engineering EmmyÂ® Award 2021
- **Detailed Box Structure:**
  - **`ftyp`:** Defines file type and compatibility (one per file)
  - **`moov`:** Contains presentation metadata with sub-boxes:
    - `mvhd` (Movie Header): Duration, timescale, etc.
    - `trak` (Track): Metadata for individual streams with components:
      - `hdlr` (Handler): Indicates stream type
      - `dinf/dref`: Data location information
      - `stbl` (Sample Table): Sample-specific metadata
  - **`mdat`:** Contains actual encoded media data

## 5. Metadata
"Data about data" or "data about multimedia resources". Components:
  - Schema: Categories of information
  - Vocabulary: Specific words/values used
  - Conceptual Model: Relationships between information elements
  - Content Standard: Rules for entering information
  - Encoding: Presentation format (e.g., XML)

### 5.1 **Classification**
- By what is described (audio, video, images, books)
- By application environment (education, libraries, web)
- By objective (administration, search, preservation)
- By implementation (embedded or separate)
- By level (low-level technical vs. high-level semantic features)

### 5.2 **Standards**
1. **Dublin Core (DC):**
   - Basic resource description (ISO 15836)
   - 15 core elements: Title, Creator, Subject, Description, Publisher, etc.
   - Generic, interoperable, extensible

2. **EBUCore:**
   - Designed for radio and TV content
   - "If you can't find it, you don't have it!" motto
   - Supports creation, management, preservation, and exchange
   - Elements include standard descriptive plus technical format aspects

3. **Other Important Schemas:**
   - **General:** XMP (ISO 16684)
   - **Images:** Exif, JPSearch, JPOnto, VRA Core
   - **Audiovisual:** MPEG-7, ID3
   - **TV:** PIMeta, PBCore, SMPTE, TV-Anytime
   - **Archives:** ISAD(G), OAI-PMH

### 5.3 **Metadata Relationship to Content**
- Can be separate from or embedded within content
- Bridges the "semantic gap" between low-level features (resolution, bitrate) and high-level meaning (subject, genre)