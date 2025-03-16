# Topic 3: Multimedia Content Transmission

## 1. Multimedia Transmission Types
- **Stored/On Demand**: Content prepared and transferred as a file for later rendering.
- **Streaming**: Rendering occurs while downloading in real-time.
- **Live**: Content generated and transmitted in real-time.
- **Interactive**: Involves multiple transmitters (e.g., video conferencing).

### 1.1 Streaming Characteristics
- **Definition**: Continuous rendering of content during transmission.
- **Key Features**:
  - Control capabilities (pause, resume, fast forward, etc.)
  - Buffering to mitigate network jitter.
  - Trade-off between network bandwidth and playback quality.
- **Requirements**:
  - Sensitive to end-to-end delay and jitter.
  - Tolerant to occasional losses (more for live content).
  - Different from file transfers (which prioritize no losses over delay).

### 1.2 Common Applications
- Traditional media broadcasts
- Online platforms (YouTube, Netflix, Spotify)
- Video conferencing (Zoom, Teams, Google Meet)

## 2. HTML5 and Multimedia

### 2.1 Evolution and Features
- Released as W3C Recommendation in 2014; now a "Living Standard"
- Reduced reliance on plugins like Flash
- Added native multimedia support

### 2.2 Key Multimedia Elements
- `<video>`, `<audio>`, `<source>`, `<track>`
- Support for various formats:
  - **Video**: MP4, WebM, Ogg (compatibility varies by browser)
  - **Audio**: MP3, WAV, Ogg Vorbis

### 2.3 Multimedia Containers
- **Proprietary**: RIFF, ASF, AVI, Flash Video
- **Open**: Matroska (.mkv), WebM (Google), Ogg (Xiph.org)

## 4. Streaming Technologies Evolution

### 4.1 Original Streaming Protocols
- **RTP (Real-time Transport Protocol)**:
  - Operates over UDP for real-time encapsulation
  - Provides timestamps and sequence numbers for synchronization
- **RTCP (RTP Control Protocol)**:
  - Monitors quality and controls transmission rates
- **RTSP (Real-time Streaming Protocol)**:
  - Controls multimedia streams via commands (SETUP, PLAY, PAUSE, TEARDOWN)

### 4.2 HTTP-Based Streaming
- **Advantages**:
  - Works through firewalls (port 80)
  - Leverages existing web infrastructure (caches, CDNs)
  - More reliable in varied network conditions

- **Types**:
  - **Progressive**: Basic rendering while downloading.
  - **Adaptive Bit Rate**: Adjusts quality based on bandwidth.

- **Commercial Solutions**:
  - HTTP Dynamic Streaming (Adobe)
  - HTTP Live Streaming (Apple)
  - Smooth Streaming (Microsoft)

## 5. Dynamic Adaptive Streaming over HTTP (DASH)

### 5.1 Architecture
- **Server**: Hosts content segmented into different qualities.
- **Client**: Downloads appropriate segments based on bandwidth.
- **MPD (Media Presentation Description)**: XML file describing available content.

### 5.2 Hierarchical Structure
- **Period**: Parts of a program (e.g., chapters)
- **Adaptation Set**: Versions of components (audio, video)
- **Representation**: Different quality levels
- **Segment**: Temporal chunks of media

### 5.3 Standardization
- ISO/IEC 23009 with multiple parts covering formats, encryption, server assistance, etc.
- Various profiles ensure compatibility across platforms

## 6. Conclusion
- HTML5 provides native multimedia support, reducing plugin dependency
- Streaming evolved from specialized protocols (RTP/RTSP) to HTTP-based solutions
- DASH offers standardized adaptive streaming leveraging existing HTTP infrastructure