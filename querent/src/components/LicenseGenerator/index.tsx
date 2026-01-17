import React, { useState } from 'react';
import styles from './styles.module.css';

export default function LicenseGenerator(): JSX.Element {
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [licenseKey, setLicenseKey] = useState('');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);
    setError('');
    setLicenseKey('');

    try {
      const response = await fetch(
        'https://us-central1-rianlicensegenerator.cloudfunctions.net/generatePublicKeyForRIAN',
        {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            name: name.trim(),
            email: email.trim(),
          }),
        }
      );

      if (!response.ok) {
        throw new Error(`Failed to generate license key: ${response.statusText}`);
      }

      const data = await response.json();
      
      // Handle different response formats
      if (data.licenseKey || data.key || data.license || data.publicKey) {
        setLicenseKey(data.licenseKey || data.key || data.license || data.publicKey);
      } else if (typeof data === 'string') {
        setLicenseKey(data);
      } else {
        setLicenseKey(JSON.stringify(data));
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : 'An error occurred while generating the license key');
    } finally {
      setLoading(false);
    }
  };

  const copyToClipboard = () => {
    navigator.clipboard.writeText(licenseKey);
    // You could add a toast notification here if desired
  };

  return (
    <div className={styles.licenseGenerator}>
      <h3>Generate License Key</h3>
      <p>Enter your name and email to generate a license key for R!AN.</p>
      
      <form onSubmit={handleSubmit} className={styles.form}>
        <div className={styles.formGroup}>
          <label htmlFor="name">Name:</label>
          <input
            type="text"
            id="name"
            value={name}
            onChange={(e) => setName(e.target.value)}
            required
            placeholder="Enter your name"
            disabled={loading}
          />
        </div>

        <div className={styles.formGroup}>
          <label htmlFor="email">Email:</label>
          <input
            type="email"
            id="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            required
            placeholder="Enter your email"
            disabled={loading}
          />
        </div>

        <button 
          type="submit" 
          className={styles.submitButton}
          disabled={loading || !name.trim() || !email.trim()}
        >
          {loading ? 'Generating...' : 'Generate License Key'}
        </button>
      </form>

      {error && (
        <div className={styles.error}>
          <strong>Error:</strong> {error}
        </div>
      )}

      {licenseKey && (
        <div className={styles.result}>
          <div className={styles.resultHeader}>
            <strong>Your License Key:</strong>
            <button 
              onClick={copyToClipboard}
              className={styles.copyButton}
              title="Copy to clipboard"
            >
              📋 Copy
            </button>
          </div>
          <div className={styles.licenseKeyDisplay}>
            <code>{licenseKey}</code>
          </div>
        </div>
      )}
    </div>
  );
}
