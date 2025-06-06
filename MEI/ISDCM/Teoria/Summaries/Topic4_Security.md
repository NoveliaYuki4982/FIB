# Security and Cryptography Summary

## 1. Introduction to Security

### 1.1 Threats

<style>
table.beautify {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td.beautify, th.beautify {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}
</style>
<table class="beautify">
  <thead>
    <tr>
      <th>Threat Category</th>
      <th>Description / Examples</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Origin</strong></td>
      <td>External vs. Internal (with respect to "infrastructure")</td>
    </tr>
    <tr>
      <td><strong>Access</strong></td>
      <td>Internal vs. External (with respect to equipment); Authorized vs. Unauthorized</td>
    </tr>
    <tr>
      <td><strong>Data Introduction</strong></td>
      <td>Malware (e.g., viruses, hoaxes)</td>
    </tr>
    <tr>
      <td><strong>Malicious Actions</strong></td>
      <td>Reading, Copying, Modifying, Deleting, Adding data</td>
    </tr>
    <tr>
      <td><strong>Communications</strong></td>
      <td>Interception, Manipulation, Impersonation ("suplantación"), Repudiation</td>
    </tr>
  </tbody>
</table>

### 1.2 Considerations
<table class="beautify">
  <thead>
    <tr>
      <th>Consideration</th>
      <th>Details / Questions</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Context</strong></td>
      <td><ul>
        <li>Identify: Who is the target? Who is the attacker?</li>
        <li>What is the motive (Why)?</li>
      </ul></td>
    </tr>
    <tr>
      <td><strong>Surface</strong></td>
      <td> Hardware, Software, data, communications, identity.</td>
    </tr>
    <tr>
      <td><strong>Harm Assessment</strong></td>
      <td><ul>
        <li>Is it recoverable?</li>
        <li>Compare protection/recovery costs vs. potential losses.</li>
      </ul></td>
    </tr>
  </tbody>
</table>

### 1.3 Protection Mechanisms
<table class="beautify">
  <thead>
    <tr>
      <th>Aspect of Protection</th>
      <th>Details</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Types</strong></td>
      <td>Preventive, Detective, Corrective</td>
    </tr>
    <tr>
      <td><strong>Categories</strong></td>
      <td>Physical, Technical, Organizational</td>
    </tr>
    <tr>
      <td><strong>External Attack Protection</strong></td>
      <td>Firewalls</td>
    </tr>
    <tr>
      <td><strong>Communication Services</strong></td>
      <td>Authentication, Non-repudiation, Confidentiality, and Integrity</td>
    </tr>
    <tr>
      <td><strong>Basic Mechanism</strong></td>
      <td>Cryptography</td>
    </tr>
  </tbody>
</table>

## 2. Cryptography
<table>
  <thead>
    <tr>
      <th colspan="3" class="main-header">Public Key (Asymmetric)</th>
      <th rowspan="2" class="main-header">Private Key (Symmetric)</th>
    </tr>
    <tr>
      <th class="sub-header">Algorithms</th>
      <th class="sub-header">Encryption/ Decryption</th>
      <th class="sub-header">Digital Signature</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><ul>
        <li>Modular arithmetic: Modular Multiplicative inverse, Extended Euclidean algorithm (“magic box”)</li>
        <li>Diffie-Hellman</li></ul></td>
      <td><ul>
        <li>RSA</li>
        <li>ElGamal</li></ul></td>
      <td>RSA</td>
      <td><ul>
        <li>Transposition</li>
        <li>Substitution</li><li>AES<li>DES</li><li>3DES</li><li>etc.</td></tr>
  </tbody>
</table>

### 2.1 Private Key (Symmetric) Cryptography
* **Process**: Sender encrypts using a shared key: $c = E_k(m)$. Recipient decrypts using the same key: $m = D_k(c)$. 'k' is the key, 'c' is ciphertext, 'm' is the message.
* **Block Cipher Principles**:
    * **Confusion**: key independence from ciphertext.
    * **Diffusion**: plaintext independence from ciphertext.
* **Algorithms**:
    * DES (Data Encryption Standard): Obsolete since 2005.
    * 3DES (Triple DES): Obsolete/deprecated end of 2023.
    * AES (Advanced Encryption Standard): Current standard (ISO/IEC 18033-3), uses permutations, 128-bit blocks, and keys of 128, 192, or 256 bits. AES involves steps like SubBytes, ShiftRows, MixColumns, and AddRoundKey.

### 2.2 Public Key (Asymmetric) Cryptography
* Public key ($K_p$) and Private/secret key ($K_s$).
* Avoids the need for secure key distribution.
* **Encryption**: Sender uses the recipient's public key: $c = E_{K_p}(m)$. Recipient uses their private key: $m = D_{K_s}(c)$.
* **Digital Signature**: Sender uses their private key: $s = E_{K_s}(m)$. Recipient uses the sender's public key to verify: $m = D_{K_p}(s)$. The sender is the signer. To save computation, often the hash of the message is signed: $s = E_{K_s}(Hash(m))$.

### 2.3 General Algorithms for Public Key
* **Modular Arithmetic**: Essential for public key crypto. Includes:
    * Modular Multiplicative Inverse.
    * Extended Euclidean Algorithm ("Magic Box").
    * Exponentiation by Squaring: Efficiently computes $x = a^z \pmod n$.
* **Diffie-Hellman (DH) Key Exchange**: Allows two parties to establish a shared secret key over an insecure channel.
    * Parties agree on a group $G$ and generator $\alpha$.
    * Alice chooses secret $a$, computes $\alpha^a$, sends to Bob.
    * Bob chooses secret $b$, computes $\alpha^b$, sends to Alice.
    * Alice computes $(\alpha^b)^a$. Bob computes $(\alpha^a)^b$. Both arrive at the same secret key $\alpha^{ab}$.
    * Example provided using $G=Z^*_{53}$, $\alpha=2$ resulting in shared key 21.
* **Elliptic-Curve Diffie-Hellman (ECDH)**: Uses elliptic curves for key generation, based on the elliptic curve discrete logarithm problem.
    * Requires agreed curve $E$ and base point $G$.
    * Alice: private key $a$, public key $A = a \cdot G$.
    * Bob: private key $b$, public key $B = b \cdot G$.
    * Shared secret: $K = a \cdot B = b \cdot A = ab \cdot G$.

### 2.4 Encryption/Decryption Algorithms for Public Key

* **RSA (Rivest, Shamir, Adleman)**
    * **Key Generation**: Choose primes $p, q$; compute $n=pq$, $\Phi(n)=(p-1)(q-1)$. Choose $e$ coprime to $\Phi(n)$; compute $d = e^{-1} \pmod{\Phi(n)}$ using Extended Euclidean Algorithm. Public key: $(n,e)$; Secret key: $d$ (or $(n,d)$). Example provided with $p=61, q=53$. Detailed calculation of $d$ using the "magic box" method is shown.
    * **Encryption**: $c = m^e \pmod n$.
    * **Decryption**: $m = c^d \pmod n$. Example encryption/decryption shown for $m=65$.
* **ElGamal**
    * **Key Generation**: Choose cyclic group $G$, generator $\alpha$. User chooses secret $a$, computes public key $K_p = \alpha^a \in G$. Secret Key $K_s = a$. Example uses $G=13, \alpha=2, a=9$.
    * **Encryption**: Sender chooses random $v$, computes $\alpha^v$ and $c = m \cdot (K_p)^v = m \cdot (\alpha^a)^v \pmod G$. Sends $(\alpha^v, c)$. Example encryption of $m=11$ shown.
    * **Decryption**: Receiver computes $(\alpha^v)^{K_s} = (\alpha^v)^a = \alpha^{va}$. Then computes $m = c \cdot (\alpha^{va})^{-1} \pmod G$ using modular multiplicative inverse. Example decryption shown, including "magic box" for inverse calculation.

### 2.5 Digital Signature
* **Signing (RSA)**: Sender (Signer A) uses their private key $d$: $s = m^d \pmod n$ (often $m$ is $Hash(m)$).
* **Verification (RSA)**: Recipient (B) uses Sender A's public key $(n,e)$: Calculates $s^e \pmod n$. This should equal $m$ (or $Hash(m)$).
* Signatures are distributed with the message. The probability of two different messages having the same hash is extremely tiny.
