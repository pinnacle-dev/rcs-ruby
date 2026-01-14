# Reference
## Brands
<details><summary><code>client.brands.<a href="/lib/pinnacle/brands/client.rb">autofill</a>(request) -> Pinnacle::Types::OptionalBrandInfo</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Automatically populate brand information based on partial input data you provide.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.brands.autofill(
  additional_info: 'A developer-friendly, compliant API for SMS, MMS, and RCS, built to scale real conversations.',
  name: 'Pinnacle',
  options: {
    force_reload: true
  },
  website: 'https://www.pinnacle.sh'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**additional_info:** `String` — Any extra details about the brand to help improve data accuracy.
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` — Name of the brand.
    
</dd>
</dl>

<dl>
<dd>

**options:** `Pinnacle::Brands::Types::AutofillBrandOptions` 
    
</dd>
</dl>

<dl>
<dd>

**website:** `String` — Brand's website URL.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Brands::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.brands.<a href="/lib/pinnacle/brands/client.rb">upsert</a>(request) -> Pinnacle::Types::ExtendedBrand</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new brand or update an existing one.

<Note>
**To create a new brand:** Omit `id` — one will be generated automatically.

All fields are **required** except `description` and `dba`, and will be validated when [submitted](/api-reference/brands/submit).
</Note>
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.brands.upsert(
  address: '500 Folsom St, San Francisco, CA 94105',
  contact: {
    email: 'michael.chen@trypinnacle.app',
    name: 'Michael Chen',
    phone: '+14155551234',
    title: 'Customer Support Representative'
  },
  dba: 'Pinnacle RCS',
  description: 'A developer-friendly, compliant API for SMS, MMS, and RCS, built to scale real conversations.',
  ein: '88-1234567',
  email: 'founders@trypinnacle.app',
  id: 'b_1234567890',
  name: 'Pinnacle',
  sector: 'TECHNOLOGY',
  type: 'PRIVATE_PROFIT',
  entity_type: 'LLC',
  website: 'https://www.pinnacle.sh'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**address:** `String` — Primary brand address where the company is located.
    
</dd>
</dl>

<dl>
<dd>

**contact:** `Pinnacle::Brands::Types::UpsertBrandSchemaContact` — Contact information for the brand.
    
</dd>
</dl>

<dl>
<dd>

**dba:** `String` — "Doing Business As" name - the public name the brand operates under.
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` — Brief description of what the brand does.
    
</dd>
</dl>

<dl>
<dd>

**ein:** `String` — Brand's Employer Identification Number (EIN) assigned by the IRS.
    
</dd>
</dl>

<dl>
<dd>

**email:** `String` — Main contact email address for the brand.
    
</dd>
</dl>

<dl>
<dd>

**id:** `String` 

The unique identifier of the brand you want to update.
<br><br> This identifier is a string that always begins with the prefix `b_`, for example: `b_1234567890`.
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` — Legal name of the brand as registered.
    
</dd>
</dl>

<dl>
<dd>

**sector:** `Pinnacle::Brands::Types::UpsertBrandSchemaSector` — Industry the brand operates in.
    
</dd>
</dl>

<dl>
<dd>

**type:** `Pinnacle::Brands::Types::UpsertBrandSchemaType` — Legal structure of the brand.
    
</dd>
</dl>

<dl>
<dd>

**entity_type:** `Pinnacle::Brands::Types::UpsertBrandSchemaEntityType` — Legal entity type of the brand.
    
</dd>
</dl>

<dl>
<dd>

**website:** `String` — Brand website URL.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Brands::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.brands.<a href="/lib/pinnacle/brands/client.rb">get</a>(id) -> Pinnacle::Types::ExtendedBrandWithVetting</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve detailed information for a specific brand in your account by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.brands.get(id: 'b_1234567890');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 

The unique identifier of the brand you want to retrieve from your account.
<br><br> This identifier is a string that always begins with the prefix `b_`, for example: `b_1234567890`.
    
</dd>
</dl>

<dl>
<dd>

**hide_ein:** `Internal::Types::Boolean` 

Optional flag to mask the Employer Identification Number in the response for security purposes.<br>

When you set this to true, the EIN value will be replaced with a masked placeholder instead of the actual number.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Brands::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.brands.<a href="/lib/pinnacle/brands/client.rb">submit</a>(brand_id) -> Pinnacle::Types::SubmissionResults</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Submit your brand for review and approval by the compliance team.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.brands.submit(brand_id: 'b_1234567890');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**brand_id:** `String` 

The unique identifier of the brand you want to submit for review. <br><br>
This identifier is a string that always begins with the prefix `b_`, for example: `b_1234567890` and must correspond to an existing brand in your account that is ready for submission.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Brands::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.brands.<a href="/lib/pinnacle/brands/client.rb">validate</a>(request) -> Pinnacle::Types::ValidationResults</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Validate your brand information for compliance and correctness before submission or storage.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.brands.validate();
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Pinnacle::Types::OptionalBrandInfo` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Brands::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.brands.<a href="/lib/pinnacle/brands/client.rb">vet</a>(brand_id, request) -> Pinnacle::Types::VettingResults</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Submit a brand for external vetting verification to enhance your brand's trust score and improved message delivery rates.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.brands.vet(
  brand_id: 'b_1234567890',
  type: 'EXTERNAL',
  provider: 'AEGIS',
  vetting_class: 'STANDARD'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**brand_id:** `String` 

The unique identifier of the brand to vet. <br>

This identifier is a string that always begins with the prefix `b_`, for example: `b_1234567890` and must correspond to an existing brand in your account that is ready for vetting.
    
</dd>
</dl>

<dl>
<dd>

**type:** `String` — Select `EXTERNAL` for third-party vetting.
    
</dd>
</dl>

<dl>
<dd>

**provider:** `String` — The vetting provider used.
    
</dd>
</dl>

<dl>
<dd>

**vetting_class:** `String` — The vetting class level.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Brands::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Audiences
<details><summary><code>client.audiences.<a href="/lib/pinnacle/audiences/client.rb">get</a>() -> Pinnacle::Audiences::Types::AudiencesGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve an audience by ID with optional pagination.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.audiences.get(id: 'aud_abc123');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Audience ID. This identifier is a string that always begins with the prefix `aud_`, for example: `aud_abc123`.
    
</dd>
</dl>

<dl>
<dd>

**page:** `Integer` — Page number. If provided with or without limit, returns paginated contacts.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Items per page. If provided with or without page, returns paginated contacts.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Audiences::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.audiences.<a href="/lib/pinnacle/audiences/client.rb">create</a>(request) -> Pinnacle::Types::AudienceCountOnly</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new audience with optional initial contacts. Phone numbers that don't exist will be auto-created as contacts.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.audiences.create(
  name: 'Marketing Campaign Q1',
  description: 'Contacts for Q1 marketing push'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**name:** `String` — Audience name.
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` — Audience description.
    
</dd>
</dl>

<dl>
<dd>

**contacts:** `Internal::Types::Array[String]` — Optional array of phone numbers (E.164 format) or contact IDs.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Audiences::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.audiences.<a href="/lib/pinnacle/audiences/client.rb">delete</a>() -> Pinnacle::Types::DeleteAudienceResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Permanently delete an audience and all its contact associations.

Note: This will NOT delete the contacts themselves, only the audience and its memberships.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.audiences.delete(id: 'aud_abc123');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Audience ID. This identifier is a string that always begins with the prefix `aud_`, for example: `aud_abc123`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Audiences::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.audiences.<a href="/lib/pinnacle/audiences/client.rb">update</a>(request) -> Pinnacle::Types::AudienceCountOnly</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update audience metadata. This endpoint does NOT modify contacts.

To add or remove contacts, use the [Add Contacts](/api-reference/audiences/add-contacts) or [Remove Contacts](/api-reference/audiences/remove-contacts) endpoints.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.audiences.update(
  id: 'aud_abc123',
  name: 'Updated Audience Name',
  description: 'New description'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Audience ID to update. This identifier is a string that always begins with the prefix `aud_`, for example: `aud_abc123`.
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` — New audience name.
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` — New audience description.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Audiences::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Contacts
<details><summary><code>client.contacts.<a href="/lib/pinnacle/contacts/client.rb">get</a>() -> Pinnacle::Types::Contact</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve contact information for a given number.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.contacts.get(id: 'co_1234567890');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 

Unique identifier of a specific contact you want to retrieve. <br>

Either this parameter or `phoneNumber` must be provided, but not both.
    
</dd>
</dl>

<dl>
<dd>

**phone_number:** `String` — Phone number you want to look up contact information for, provided in URL-encoded E.164 format with %2B prefix instead of +.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Contacts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.contacts.<a href="/lib/pinnacle/contacts/client.rb">create</a>(request) -> Pinnacle::Types::ContactId</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new contact for a given phone number.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.contacts.create(phone_number: 'phoneNumber');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**phone_number:** `String` — Phone number to save for your contact, in E.164 format.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Contacts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.contacts.<a href="/lib/pinnacle/contacts/client.rb">update</a>(request) -> Pinnacle::Types::UpdatedContactId</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update an existing contact.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.contacts.update(
  description: 'Retired',
  email: 'alvaroopedtech@pinnacle.sh',
  name: 'Retired Bestie',
  tags: ['friend'],
  id: 'co_1234567890'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the contact you want to update. This identifier is a string that always begins with the prefix `co_`, for example: `co_1234567890`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Contacts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Conversations
<details><summary><code>client.conversations.<a href="/lib/pinnacle/conversations/client.rb">get</a>(request) -> Pinnacle::Types::Conversation</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Fetch a specific conversation using either its unique identifier or by matching sender and recipient details.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.conversations.get(id: 'conv_1234567890');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Pinnacle::Types::GetConversationParams` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Conversations::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.conversations.<a href="/lib/pinnacle/conversations/client.rb">list</a>(request) -> Pinnacle::Types::ConversationList</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves conversations by page with optional filtering based off provided parameters.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.conversations.list(
  brand_id: 'b_1234567890',
  campaign_id: 'tf_1234567890',
  campaign_type: 'TOLL_FREE',
  page_index: 0,
  page_size: 20,
  receiver: '+16509231662',
  sender: '+18445551234'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**brand_id:** `String` — The unique identifier of the brand to filter conversations. This identifier is a string that always begins with the prefix `b_`, for example: `b_1234567890`.
    
</dd>
</dl>

<dl>
<dd>

**campaign_id:** `String` 

The unique identifier of the campaign to filter conversations. This identifier is a string that begins with the prefix: 
- TOLL_FREE: `tf_` (e.g., `tf_1234567890`)
- 10DLC: `dlc_` (e.g., `dlc_1234567890`)
- RCS: `rcs_` (e.g., `rcs_1234567890`)
    
</dd>
</dl>

<dl>
<dd>

**campaign_type:** `Pinnacle::Types::CampaignEnum` 
    
</dd>
</dl>

<dl>
<dd>

**page_index:** `Integer` — Zero-based index for pagination.
    
</dd>
</dl>

<dl>
<dd>

**page_size:** `Integer` — Number of conversations to return per page.
    
</dd>
</dl>

<dl>
<dd>

**receiver:** `String` — Receiver's phone number in E.164 format.
    
</dd>
</dl>

<dl>
<dd>

**sender:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Conversations::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.conversations.<a href="/lib/pinnacle/conversations/client.rb">update</a>(request) -> Pinnacle::Types::SuccessfulConversationUpdate</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update the notes associated with a specific conversation.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.conversations.update(
  id: 'conv_1234567890',
  notes: 'Follow-up completed. Customer satisfied with resolution.'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the conversation to update. This identifier is a string that always begins with the prefix `conv_`, for example: `conv_1234567890`.
    
</dd>
</dl>

<dl>
<dd>

**notes:** `String` — New notes or comments for the conversation.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Conversations::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.conversations.<a href="/lib/pinnacle/conversations/client.rb">list_messages</a>(id) -> Pinnacle::Types::MessageList</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a paginated and filtered list of messages for a specific conversation.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.conversations.list_messages(id: 'id');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Unique identifier of the conversation. This identifier is a string that always begins with the prefix `conv_`, for example: `conv_1234567890`.
    
</dd>
</dl>

<dl>
<dd>

**page_index:** `Integer` — Zero-based index for pagination.
    
</dd>
</dl>

<dl>
<dd>

**page_size:** `Integer` — Number of messages to return per page.
    
</dd>
</dl>

<dl>
<dd>

**sort_order:** `Pinnacle::Conversations::Types::ConversationsListMessagesRequestSortOrder` 

Sort order for messages. <br>

- `asc`: Oldest messages first
- `desc`: Newest messages first (default)
    
</dd>
</dl>

<dl>
<dd>

**direction:** `Pinnacle::Conversations::Types::ConversationsListMessagesRequestDirection` 

Filter messages by direction. <br>

- `INBOUND`: Messages received from contacts
- `OUTBOUND`: Messages sent to contacts
    
</dd>
</dl>

<dl>
<dd>

**status:** `Pinnacle::Conversations::Types::ConversationsListMessagesRequestStatus` — Filter messages by delivery status.
    
</dd>
</dl>

<dl>
<dd>

**type:** `Pinnacle::Conversations::Types::ConversationsListMessagesRequestType` — Filter messages by protocol type.
    
</dd>
</dl>

<dl>
<dd>

**date_from:** `String` — Filter messages sent on or after this date (ISO 8601 format).
    
</dd>
</dl>

<dl>
<dd>

**date_to:** `String` — Filter messages sent on or before this date (ISO 8601 format).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Conversations::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Messages
<details><summary><code>client.messages.<a href="/lib/pinnacle/messages/client.rb">get</a>(id) -> Pinnacle::Types::Message</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a previously sent message.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.messages.get(id: 'msg_1234567890');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Unique identifier of the message. This identifier is a string that always begins with the prefix `msg_`, for example: `msg_1234567890`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Messages::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/lib/pinnacle/messages/client.rb">react</a>(request) -> Pinnacle::Types::ReactionResult</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Add or remove an emoji reaction to a previously sent message.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.messages.react(
  message_id: 'msg_1234567890',
  options: {
    force: true
  },
  reaction: '👍'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**message_id:** `String` — Unique identifier of the message. This identifier is a string that always begins with the prefix `msg_`, for example: `msg_1234567890`.
    
</dd>
</dl>

<dl>
<dd>

**options:** `Pinnacle::Messages::Types::ReactMessageOptions` 
    
</dd>
</dl>

<dl>
<dd>

**reaction:** `String` 

Unicode emoji to add. <br>

Use `null` to remove existing reaction.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Messages::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## PhoneNumbers
<details><summary><code>client.phone_numbers.<a href="/lib/pinnacle/phone_numbers/client.rb">search</a>(request) -> Internal::Types::Array[Pinnacle::Types::PhoneNumberDetails]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Search for available phone numbers that match your exact criteria.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.phone_numbers.search(
  features: ['SMS', 'MMS'],
  location: {
    city: 'New York',
    national_destination_code: '212'
  },
  number: {
    contains: '514',
    starts_with: '45'
  },
  options: {
    limit: 4
  },
  type: ['LOCAL']
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**features:** `Internal::Types::Array[Pinnacle::Types::PhoneFeatureEnum]` 
    
</dd>
</dl>

<dl>
<dd>

**location:** `Pinnacle::PhoneNumbers::Types::SearchPhoneNumberByLocation` 

Filter your search by geographic location to find numbers in specific regions. <br>

Toll-free numbers ignore city and state filters.
    
</dd>
</dl>

<dl>
<dd>

**number:** `Pinnacle::PhoneNumbers::Types::SearchPhoneNumberByDigits` — Filter your search by digit pattern.
    
</dd>
</dl>

<dl>
<dd>

**options:** `Pinnacle::PhoneNumbers::Types::SearchPhoneNumberOptions` — Extra search settings to control how many results you get.
    
</dd>
</dl>

<dl>
<dd>

**type:** `Internal::Types::Array[Pinnacle::Types::PhoneEnum]` — Types of phone numbers to return in your search.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::PhoneNumbers::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.phone_numbers.<a href="/lib/pinnacle/phone_numbers/client.rb">buy</a>(request) -> Internal::Types::Array[Pinnacle::Types::PurchasedNumber]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Purchase one or more phone numbers found through the [search endpoint](./search). <br>

Billing uses your account credits and the numbers are ready for immediate use.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.phone_numbers.buy(numbers: ['+18559491727']);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**numbers:** `Internal::Types::Array[String]` 

List of phone numbers you want to purchase, each in international E.164 format. <br>

All specified numbers must be currently available and will be validated for availability before processing the purchase. <br>

If any number in the request is unavailable or invalid, no purchases will be made and the request will be voided.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::PhoneNumbers::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.phone_numbers.<a href="/lib/pinnacle/phone_numbers/client.rb">get</a>(request) -> Pinnacle::PhoneNumbers::Types::PhoneNumbersGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve information about any phone number.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.phone_numbers.get(
  phone: '+11234567890',
  level: 'advanced',
  options: {
    risk: true,
    enhanced_contact_info: {
      context: 'This is my friend from JZ. He has done a lot in the crypto space.'
    }
  }
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**phone:** `String` — Phone number you want to analyze in E.164 format.
    
</dd>
</dl>

<dl>
<dd>

**level:** `Pinnacle::PhoneNumbers::Types::PhoneDetailsSchemaLevel` 

Choose how much detail you want in your results:
- `basic`: Receive essential info like carrier, location, and format.
- `advanced`: Receive a deeper analysis including fraud risk, detailed location, and enhanced contact info.
    
</dd>
</dl>

<dl>
<dd>

**options:** `Pinnacle::PhoneNumbers::Types::RetrievePhoneNumberDetailsOptions` — Customize your lookup with additional options.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::PhoneNumbers::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## RCS
<details><summary><code>client.rcs.<a href="/lib/pinnacle/rcs/client.rb">get_capabilities</a>(request) -> Internal::Types::Hash[String, Pinnacle::Types::RcsCapability]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Check RCS capabilities for one or more phone numbers.

This endpoint allows you to verify which RCS features (cards, buttons, etc.) are supported
on specific phone numbers before sending RCS messages to them.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.rcs.get_capabilities(phone_numbers: ['+12345678901', '+19876543210']);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**phone_numbers:** `Internal::Types::Array[String]` 

List of phone numbers to check RCS capabilities for (E.164 format). <br><br>
**Limit:** 1 min
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Rcs::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.rcs.<a href="/lib/pinnacle/rcs/client.rb">whitelist</a>(request) -> Pinnacle::Types::RcsWhitelistResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Whitelist a phone number for testing with your test RCS agent.

## Overview
During development and testing, RCS agents can only send messages to whitelisted phone numbers.
Use this endpoint to whitelist specific phone numbers to send and receive messages from the test agent.

## Verification Process
After whitelisting a number, you'll need to complete verification:

1. Check the test device for message from "RBM Tester Management"
2. Click the "Make me a tester" button
3. Enter the separate 4-digit verification SMS code in the Pinnacle dashboard at:
   ```
   https://app.pinnacle.sh/dashboard/brands/{brandId}?campaignId={campaignId}&campaignType=RCS
   ```

 > **⚠️ Important: Re-whitelisting Numbers**
>
> If you whitelist a number that's already whitelisted, you'll receive a new message from "RBM Tester Management". **You must click the "Make me a tester" button again to continue sending and receiving messages.**

> **Important Notes**
>
> - **Verification required:** Messages cannot be sent nor received until you have clicked the "Make me a tester" button on the test device.
> - **Testing only:** This is only required for test agents. Production agents can message any RCS-enabled number.
> - **Network limitations:** Whitelisting may be temporarily unavailable for some carriers but are usually restored shortly.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.rcs.whitelist(
  agent_id: 'agent_XXXXXXXXXXXX',
  phone_number: '+12345678901'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**agent_id:** `String` — The RCS agent ID (must be prefixed with 'agent_')
    
</dd>
</dl>

<dl>
<dd>

**phone_number:** `String` — Phone number to whitelist for testing (E.164 format)
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Rcs::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.rcs.<a href="/lib/pinnacle/rcs/client.rb">get_link</a>(request) -> Pinnacle::Types::RcsLinkResult</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Generate a link for initiating an RCS conversation with your agent. 

Users can click these links to start conversations with your RCS agent directly
from websites, emails, or other applications.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.rcs.get_link(
  agent_id: 'agent_XXXXXXXXXXXX',
  test_mode: false,
  phone_number: '+12345678901',
  body: 'Hello, I need help with my order'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**agent_id:** `String` — The RCS agent ID (must be prefixed with 'agent_')
    
</dd>
</dl>

<dl>
<dd>

**test_mode:** `Internal::Types::Boolean` — Link to the test agent or the production agent if false
    
</dd>
</dl>

<dl>
<dd>

**phone_number:** `String` — Fallback phone number (E.164 format) to use if the phone number does not support RCS. If not provided, no url will be generated.
    
</dd>
</dl>

<dl>
<dd>

**body:** `String` — Optional message body to pre-fill after the user clicks the link
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Rcs::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Webhooks
<details><summary><code>client.webhooks.<a href="/lib/pinnacle/webhooks/client.rb">get</a>(request) -> Pinnacle::Types::WebhookResult</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve all webhook that are set up to receive events for specific URLs or phone numbers.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.webhooks.get(identifiers: ['https://www.pinnacle.sh/payment', '+14155678901', 'https://www.pinnacle.sh/sms-callback', '+14153456659']);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**identifiers:** `Internal::Types::Array[String]` 

List of URLs or phone numbers in E.164 format that the webhook is attached to. <br><br>
**Limit:** 1 min
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Webhooks::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Audiences Contacts
<details><summary><code>client.audiences.contacts.<a href="/lib/pinnacle/audiences/contacts/client.rb">remove</a>(request) -> Pinnacle::Types::AudienceCountOnly</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Remove contacts from an existing audience. This operation is idempotent.

- Only removes contacts that exist in the audience
- Contacts not in the audience are ignored
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.audiences.contacts.remove(
  id: 'aud_abc123',
  contacts: ['+12125551234', 'co_def456']
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Audience ID. This identifier is a string that always begins with the prefix `aud_`, for example: `aud_abc123`.
    
</dd>
</dl>

<dl>
<dd>

**contacts:** `Internal::Types::Array[String]` 

Array of phone numbers (E.164 format) or contact IDs. <br><br>
**Limit:** 1 min
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Audiences::Contacts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.audiences.contacts.<a href="/lib/pinnacle/audiences/contacts/client.rb">add</a>(request) -> Pinnacle::Types::AudienceCountOnly</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Add contacts to an existing audience. This operation is additive and idempotent.

- Phone numbers that don't exist will be auto-created as contacts
- Duplicate adds are ignored
- Contacts already in the audience are ignored
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.audiences.contacts.add(
  id: 'aud_abc123',
  contacts: ['+12125551234', 'co_def456', '+13105551234']
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Audience ID. This identifier is a string that always begins with the prefix `aud_`, for example: `aud_abc123`.
    
</dd>
</dl>

<dl>
<dd>

**contacts:** `Internal::Types::Array[String]` 

Array of phone numbers (E.164 format) or contact IDs. <br><br>
**Limit:** 1 min
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Audiences::Contacts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Campaigns Dlc
<details><summary><code>client.campaigns.dlc.<a href="/lib/pinnacle/campaigns/dlc/client.rb">autofill</a>(request) -> Pinnacle::Types::AutofillDlcCampaignResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Generate campaign details based off existing campaign and the brand it's connected to.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.campaigns.dlc.autofill(
  additional_info: 'Please autofill missing campaign fields using my brand profile',
  campaign_id: 'dlc_1234567890'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Pinnacle::Types::AutofillCampaignParams` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Campaigns::Dlc::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.campaigns.dlc.<a href="/lib/pinnacle/campaigns/dlc/client.rb">get</a>(campaign_id) -> Pinnacle::Types::DlcCampaignWithExtendedBrandAndStatus</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve 10DLC campaign.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.campaigns.dlc.get(campaign_id: 'dlc_1234567890');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**campaign_id:** `String` — Unique identifier of the 10DLC campaign. This identifier is a string that always begins with the prefix `dlc_`, for example: `dlc_1234567890`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Campaigns::Dlc::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.campaigns.dlc.<a href="/lib/pinnacle/campaigns/dlc/client.rb">submit</a>(campaign_id) -> Pinnacle::Types::CampaignSubmissionResult</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Submit your 10DLC campaign for approval and activation with carriers.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.campaigns.dlc.submit(campaign_id: 'dlc_1234567890');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**campaign_id:** `String` 

Unique identifier of the 10DLC campaign to submit.
<br><br> This identifier is a string that always begins with the prefix `dlc_`, for example: `dlc_1234567890`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Campaigns::Dlc::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.campaigns.dlc.<a href="/lib/pinnacle/campaigns/dlc/client.rb">upsert</a>(request) -> Pinnacle::Types::DlcCampaignWithExtendedBrandAndStatus</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new 10DLC campaign or update an existing one.

<Note>
**To create a new campaign:** Omit `campaignId` — one will be generated automatically.

**Before you start:** Create a [brand](/api-reference/brands/upsert) first — you'll need its `id` for the [`brand`](#request.body.brand) field.

All fields are **required** unless specified otherwise, and will be validated when [submitted](/api-reference/campaigns/10-dlc/submit).

**See the response for example values for each field.**
</Note>
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.campaigns.dlc.upsert(
  auto_renew: true,
  brand: 'b_1234567890',
  description: 'This campaign sends transactional SMS messages to customers who have opted in, including account notifications, security alerts, and customer care responses. Messages are sent when triggered by account activity such as login attempts, password changes, order updates, or support inquiries. All messages include required STOP/HELP disclosures and comply with TCPA guidelines.',
  keywords: {
    help: {
      message: 'Pinnacle Software Development Inc.: For assistance, visit https://pinnacle.sh/support or email founders@trypinnacle.app. Msg&data rates may apply. Reply STOP to cancel.',
      values: ['HELP', 'SUPPORT', 'INFO']
    },
    opt_in: {
      message: "Pinnacle Software Development Inc.: You're enrolled in account & security alerts. Msg&data rates may apply. Message frequency varies. Reply HELP for help, STOP to cancel. Terms: https://pinnacle.sh/terms Privacy: https://pinnacle.sh/privacy",
      values: ['START', 'YES', 'SUBSCRIBE']
    },
    opt_out: {
      message: "Pinnacle Software Development Inc.: You're unsubscribed and will receive no further texts. For assistance, visit https://pinnacle.sh or call 877-389-0460. Reply START to resubscribe.",
      values: ['STOP', 'CANCEL', 'UNSUBSCRIBE']
    }
  },
  links: {
    privacy_policy: 'https://www.pinnacle.sh/privacy',
    terms_of_service: 'https://www.pinnacle.sh/terms'
  },
  message_flow: 'The user fills out a paper form during onboarding at [Address] which they learn about at our website (https://pinnacle.sh) in which they provide their phone number and sign their consent. The form includes a disclaimer: "By signing this form and providing your phone number, you agree to receive SMS Mixed - Account Notification, Customer Care, Security Alert, Delivery Notification from Pinnacle Software Development Inc. Message frequency may vary. Standard Message and Data Rates may apply. Reply STOP to opt out. Reply HELP for help. Consent is not a condition of purchase. Your mobile information will not be sold or shared with third parties for promotional or marketing purposes." Once the information is entered into the system, the user receives a confirmation SMS: "Thank you for signing up for SMS updates from Pinnacle Software Development Inc. Msg freq may vary. Std msg & data rates apply. Reply STOP to opt out, HELP for help." Link to paper form: https://www.pinnacle.sh/opt-in',
  name: "Pinnacle's Account Notifications",
  options: {
    affiliate_marketing: false,
    age_gated: false,
    direct_lending: false,
    embedded_link: 'https://www.pinnacle.sh/example',
    embedded_phone: false,
    number_pooling: false
  },
  sample_messages: ["Pinnacle Software Development Inc.: We're here to help. Visit https://pinnacle.sh or call 877-389-0460. Msg&data rates may apply. Reply STOP to cancel.", "Pinnacle Software Development Inc.: You're enrolled in account & security alerts. Msg&data rates may apply. Message frequency varies. Reply HELP for help, STOP to cancel. Terms: https://pinnacle.sh/terms/ Privacy: https://pinnacle.sh/privacy/", 'Pinnacle Software Development Inc.: An update has been made to your account. Read it in the portal.', 'Pinnacle Software Development Inc.: We received your message. A team member will reply shortly. For immediate help call 877-389-0460. Msg&data rates may apply. Reply STOP to cancel.'],
  use_case: {
    sub: ['ACCOUNT_NOTIFICATION', 'CUSTOMER_CARE', 'SECURITY_ALERT'],
    value: 'MIXED'
  }
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auto_renew:** `Internal::Types::Boolean` — Whether the campaign renews automatically.
    
</dd>
</dl>

<dl>
<dd>

**brand:** `String` — Brand id. This identifier is a string that always begins with the prefix `b_`, for example: `b_1234567890`.
    
</dd>
</dl>

<dl>
<dd>

**campaign_id:** `String` — Unique identifier for the campaign. This identifier is a string that always begins with the prefix `dlc_`, for example: `dlc_1234567890`.
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` 

Description of the campaign. Explain the purpose, use case, and types of messages your campaign will send.

**Example:** `This campaign allows users who have specifically opted in to interact with our chatbot for a range of automated services, including order status notifications, shipping updates, security alerts, and help desk support. Users can manage their account, receive transactional SMS prompts, and access interactive support. They may also share images, such as receipts, and receive immediate responses for support or account updates. All messages are strictly transactional or support-related, never unsolicited, and initiated only after clear user consent.`
    
</dd>
</dl>

<dl>
<dd>

**keywords:** `Pinnacle::Campaigns::Dlc::Types::DlcCampaignKeywords` — Keyword response configuration.
    
</dd>
</dl>

<dl>
<dd>

**links:** `Pinnacle::Campaigns::Dlc::Types::DlcCampaignLinks` — Legal documentation links.
    
</dd>
</dl>

<dl>
<dd>

**message_flow:** `String` — Describe your opt-in workflow. See the [Opt-In Methods and Workflow](/guides/campaigns/opt-in-compliance#opt-in-methods-and-workflow) section for requirements and examples.
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` — Display name of the campaign.
    
</dd>
</dl>

<dl>
<dd>

**options:** `Pinnacle::Campaigns::Dlc::Types::DlcCampaignOptions` — Campaign configuration options.
    
</dd>
</dl>

<dl>
<dd>

**sample_messages:** `Internal::Types::Array[String]` — Example messages for the campaign. Include 1-5 messages that represent the types of messages you will send. See the [Sample Messages](/guides/campaigns/opt-in-compliance#sample-messages) section for requirements and examples.
    
</dd>
</dl>

<dl>
<dd>

**use_case:** `Pinnacle::Campaigns::Dlc::Types::DlcCampaignUseCase` — Use case for the campaign.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Campaigns::Dlc::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.campaigns.dlc.<a href="/lib/pinnacle/campaigns/dlc/client.rb">validate</a>(request) -> Pinnacle::Types::CampaignValidationResult</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Validate your 10DLC campaign configuration against carrier requirements and compliance rules.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.campaigns.dlc.validate(
  additional_info: 'Please validate this DLC campaign for 10DLC compliance',
  campaign_id: 'dlc_1234567890'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Pinnacle::Types::ValidateCampaignParams` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Campaigns::Dlc::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Campaigns TollFree
<details><summary><code>client.campaigns.toll_free.<a href="/lib/pinnacle/campaigns/toll_free/client.rb">autofill</a>(request) -> Pinnacle::Campaigns::TollFree::Types::TollFreeAutofillResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Generate campaign details based off existing campaign and the brand it's connected to.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.campaigns.toll_free.autofill(
  additional_info: 'Please autofill missing campaign fields using my brand profile',
  campaign_id: 'dlc_1234567890'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Pinnacle::Types::AutofillCampaignParams` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Campaigns::TollFree::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.campaigns.toll_free.<a href="/lib/pinnacle/campaigns/toll_free/client.rb">get</a>(campaign_id) -> Pinnacle::Types::TollFreeCampaignWithExtendedBrandAndStatus</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve Toll-Free campaign.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.campaigns.toll_free.get(campaign_id: 'tf_1234567890');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**campaign_id:** `String` — Unique identifier of toll-free campaign. Must begin with the prefix `tf_`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Campaigns::TollFree::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.campaigns.toll_free.<a href="/lib/pinnacle/campaigns/toll_free/client.rb">submit</a>(campaign_id) -> Pinnacle::Types::CampaignSubmissionResult</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Submit your toll-free campaign for approval and activation with carriers.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.campaigns.toll_free.submit(campaign_id: 'tf_1234567890');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**campaign_id:** `String` — Unique identifier of the toll-free campaign to submit. Must begin with the prefix `tf_`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Campaigns::TollFree::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.campaigns.toll_free.<a href="/lib/pinnacle/campaigns/toll_free/client.rb">upsert</a>(request) -> Pinnacle::Types::TollFreeCampaignWithExtendedBrandAndStatus</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new toll-free campaign or update an existing one.

<Note>
**To create a new campaign:** Omit `campaignId` — one will be generated automatically.

**Before you start:** Create a [brand](/api-reference/brands/upsert) first — you'll need its `id` for the [`brand`](#request.body.brand) field.

All fields are **required** unless specified otherwise, and will be validated when [submitted](/api-reference/campaigns/toll-free/submit).

**See the response for example values for each field.**
</Note>
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.campaigns.toll_free.upsert(
  brand: 'b_1234567890',
  campaign_id: 'tf_1234567890',
  keywords: {
    help: {
      message: 'Pinnacle Software Development Inc.: For assistance, visit https://pinnacle.sh/support or email founders@trypinnacle.app. Msg&data rates may apply. Reply STOP to cancel.'
    },
    opt_in: {
      message: "Pinnacle Software Development Inc.: You're enrolled in account & security alerts. Msg&data rates may apply. Message frequency varies. Reply HELP for help, STOP to cancel. Terms: https://pinnacle.sh/terms/ Privacy: https://pinnacle.sh/privacy/",
      keywords: ['START', 'SUBSCRIBE']
    }
  },
  links: {
    privacy_policy: 'https://www.pinnacle.sh/privacy',
    terms_of_service: 'https://www.pinnacle.sh/terms'
  },
  monthly_volume: '10,000',
  name: 'Pinnacle',
  opt_in: {
    method_: 'PAPER',
    url: 'https://www.pinnacle.sh/opt-in',
    workflow_description: "End users opt-in when filling out the in-person intake forms where they will write their phone numbers and check a box indicating that they've opted in to messages. Link to paper form: https://www.pinnacle.sh/opt-in"
  },
  options: {
    age_gated: false
  },
  production_message_content: "Hi [First Name], your order #[Order ID] has shipped and will arrive [Date]. Track here: [URL]. Reply HELP for help or STOP to unsubscribe.",
  use_case: {
    summary: 'Customers who have opted into text messages can interact with our automated SMS chatbot to receive transaction-driven notifications (order status, shipping updates, account alerts), ask support questions, share photos with friends, and manage their account details via simple, conversational text flows. All messages are transactional or interactive flows customers opt into. Users can send images (e.g., receipts) and get guided replies.',
    value: 'CHATBOT'
  }
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**brand:** `String` — Brand id. This identifier is a string that always begins with the prefix `b_`, for example: `b_1234567890`.
    
</dd>
</dl>

<dl>
<dd>

**campaign_id:** `String` — Unique identifier for the campaign. This identifier is a string that always begins with the prefix `tf_`, for example: `tf_1234567890`.
    
</dd>
</dl>

<dl>
<dd>

**keywords:** `Pinnacle::Campaigns::TollFree::Types::TollFreeCampaignKeywords` — Keyword response configuration.
    
</dd>
</dl>

<dl>
<dd>

**links:** `Pinnacle::Campaigns::TollFree::Types::TollFreeCampaignLinks` — Legal documentation links.
    
</dd>
</dl>

<dl>
<dd>

**monthly_volume:** `Pinnacle::Types::MessageVolumeEnum` 
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` — Display name of the campaign. This is not sent to carriers for approval and is only used for your reference on the Pinnacle dashboard.
    
</dd>
</dl>

<dl>
<dd>

**opt_in:** `Pinnacle::Campaigns::TollFree::Types::TollFreeCampaignOptIn` — Opt-in method and workflow.
    
</dd>
</dl>

<dl>
<dd>

**options:** `Pinnacle::Campaigns::TollFree::Types::TollFreeCampaignOptions` — Campaign configuration options.
    
</dd>
</dl>

<dl>
<dd>

**production_message_content:** `String` — Example message(s) that would be sent in production. Should reflect the actual content users will receive, including HELP/STOP disclosures. See the [Production Message Content](/guides/campaigns/opt-in-compliance#production-message-content) section for requirements.
    
</dd>
</dl>

<dl>
<dd>

**use_case:** `Pinnacle::Campaigns::TollFree::Types::TollFreeCampaignUseCase` — Use case classification for the campaign.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Campaigns::TollFree::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.campaigns.toll_free.<a href="/lib/pinnacle/campaigns/toll_free/client.rb">validate</a>(request) -> Pinnacle::Types::CampaignValidationResult</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Validate your toll-free campaign configuration against carrier requirements and compliance rules.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.campaigns.toll_free.validate(
  additional_info: 'Please validate this DLC campaign for 10DLC compliance',
  campaign_id: 'dlc_1234567890'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Pinnacle::Types::ValidateCampaignParams` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Campaigns::TollFree::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Campaigns Rcs
<details><summary><code>client.campaigns.rcs.<a href="/lib/pinnacle/campaigns/rcs/client.rb">autofill</a>(request) -> Pinnacle::Campaigns::Rcs::Types::RcsAutofillResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Generate campaign details based off existing campaign and the brand it's connected to.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.campaigns.rcs.autofill(
  additional_info: 'Please autofill missing campaign fields using my brand profile',
  campaign_id: 'dlc_1234567890'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Pinnacle::Types::AutofillCampaignParams` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Campaigns::Rcs::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.campaigns.rcs.<a href="/lib/pinnacle/campaigns/rcs/client.rb">get</a>(campaign_id) -> Pinnacle::Types::ExtendedRcsCampaign</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve RCS campaign.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.campaigns.rcs.get(campaign_id: 'rcs_1234567890');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**campaign_id:** `String` — Unique identifier of the RCS campaign. Must begin with the prefix `rcs_`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Campaigns::Rcs::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.campaigns.rcs.<a href="/lib/pinnacle/campaigns/rcs/client.rb">submit</a>(campaign_id) -> Pinnacle::Types::CampaignSubmissionResult</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Submit your RCS campaign for approval and activation with carriers.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.campaigns.rcs.submit(campaign_id: 'rcs_1234567890');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**campaign_id:** `String` — Unique identifier of the RCS campaign to retrieve. Must begin with the prefix `rcs_`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Campaigns::Rcs::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.campaigns.rcs.<a href="/lib/pinnacle/campaigns/rcs/client.rb">upsert</a>(request) -> Pinnacle::Types::ExtendedRcsCampaign</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new RCS campaign or update an existing one.

<Note>
**To create a new campaign:** Omit `campaignId` — one will be generated automatically.

**Before you start:** Create a [brand](/api-reference/brands/upsert) first — you'll need its `id` for the [`brand`](#request.body.brand) field.

All fields are **required** unless specified otherwise, and will be validated when [submitted](/api-reference/campaigns/rcs/submit).
</Note>
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.campaigns.rcs.upsert(
  agent: {
    color: "#000000",
    description: 'Experience the power of RCS messaging with interactive demos. Test rich features like carousels, suggested replies, and media sharing. Get started with our developer-friendly APIs.',
    emails: [{
      email: 'founders@trypinnacle.app',
      label: 'Email Us'
    }],
    hero_url: 'https://pncl.to/D6pDSqGxqgfbCfQmw4gXdnlHu4uSB4',
    icon_url: 'https://pncl.to/mq_tdIDenRb5eYpJiM8-3THCaUBrZP',
    name: 'Pinnacle - RCS Demo',
    phones: [{
      label: 'Contact us directly',
      phone: '+14154467821'
    }],
    websites: [{
      label: 'Get started with Pinnacle',
      url: 'https://www.trypinnacle.app/'
    }]
  },
  brand: 'b_1234567890',
  campaign_id: 'rcs_1234567890',
  expected_agent_responses: ['Here are the things I can help you with.', 'I can assist you with booking an appointment, or you may choose to book manually.', 'Here are the available times to connect with a representative tomorrow.', 'Your appointment has been scheduled.'],
  links: {
    privacy_policy: 'https://www.trypinnacle.app/privacy',
    terms_of_service: 'https://www.trypinnacle.app/terms'
  },
  use_case: {
    behavior: 'Pinnacle is a developer-focused RCS assistant that helps teams design, test, and optimize rich messaging experiences across SMS, MMS, and RCS. The agent acts as both an “onboarding guide” for new customers and a “best-practices coach” for existing teams exploring higher-value RCS workflows like rich cards, carousels, and suggested actions.<br>
    The agent delivers a mix of operational updates and educational content (2–6 messages/month). Content includes important platform notices (e.g., deliverability or throughput changes), implementation tips with sample RCS templates, and personalized recommendations on how to upgrade existing SMS campaigns into richer, higher-converting RCS conversations.
    ',
    value: 'OTHER'
  },
  opt_in_terms_and_conditions: 'We ensure consent through an explicit opt-in process that follows 10DLC best practices.Users must agree to receive messages from Pinnacle before the agent sends them any messages.<br>
  Users agree to these messages by signing an opt-in paper form that they can be found online at https://www.pinnacle.sh/opt-in. We only send messages once users have filled out the form and submitted it to us via email or through the dashboard.
  ',
  messaging_type: 'MULTI_USE',
  carrier_description: 'Demonstrate the power of RCS to medium and large companies already sending massive SMS/MMS volumes through our platform. These clients send conversational messages in industries such as commerce, appointments, and customer support.',
  keywords: {
    help: {
      message: 'Email founders@trypinnacle.app for support.',
      keywords: ['HELP', 'SUPPORT']
    },
    opt_in: {
      message: "Welcome back to Pinnacle!<br>
      🔔 You're now subscribed to Pinnacle - RCS Demo and will continue receiving important updates and news. Feel free to contact this us at any time for help.<br>
      
      Reply STOP to opt out and HELP for support. Message & rates may apply.
      ",
      keywords: ['START', 'SUBSCRIBE']
    },
    opt_out: {
      message: "You've been unsubscribed from Pinnacle - RCS Demo and will no longer receive notifications. If you ever change your mind, reply START or SUBSCRIBE to rejoin anytime.",
      keywords: ['STOP', 'UNSUBSCRIBE', 'END']
    }
  },
  traffic: {
    monthly_website: 10000,
    monthly_rcs_estimate: 10000
  },
  agent_triggers: 'The agent sends the first message when the user subscribes to Pinnacle. Messages are based on user actions such as pressing suggestion buttons. External triggers such as reminders can be setup by users in advance for a later time.',
  interaction_description: "The agent's primary interaction will be customer service — helping users with questions, troubleshooting issues, and providing quick assistance through chat. Other interactions include appointment management and sending notifications to the user.",
  is_conversational: true,
  cta_language: 'By checking this box and submitting this form, you consent to receive transactional text messages for support, appointment, and reminder messages from Pinnacle Software Development Inc. Reply STOP to opt out. Reply HELP for help. Standard message and data rates may apply. Message frequency may vary. View our Terms and Conditions at https://www.pinnacle.sh/terms. View our Privacy Policy at https://www.pinnacle.sh/privacy.',
  demo_trigger: 'Text "START" to trigger the flow.'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**agent:** `Pinnacle::Campaigns::Rcs::Types::RcsAgent` — Create an agent for the campaign.
    
</dd>
</dl>

<dl>
<dd>

**brand:** `String` — Unique identifier for the brand.
    
</dd>
</dl>

<dl>
<dd>

**campaign_id:** `String` — Unique identifier for the campaign.
    
</dd>
</dl>

<dl>
<dd>

**expected_agent_responses:** `Internal::Types::Array[String]` 

List of what the agent might say to users. See the [Expected Agent Responses](/guides/campaigns/rcs-compliance#expected-agent-responses) section for requirements. <br><br>
**Limit:** 1 to 5
    
</dd>
</dl>

<dl>
<dd>

**links:** `Pinnacle::Campaigns::Rcs::Types::RcsLinks` — Legal documentation links.
    
</dd>
</dl>

<dl>
<dd>

**use_case:** `Pinnacle::Campaigns::Rcs::Types::RcsUseCase` — Use case classification for the campaign.
    
</dd>
</dl>

<dl>
<dd>

**opt_in_terms_and_conditions:** `String` — Details on how opt-in is acquired. If it is done through a website or app, provide the link. See the [Opt-In Terms and Conditions](/guides/campaigns/rcs-compliance#opt-in-terms-and-conditions) section for requirements.
    
</dd>
</dl>

<dl>
<dd>

**messaging_type:** `Pinnacle::Types::RcsMessagingTypeEnum` 
    
</dd>
</dl>

<dl>
<dd>

**carrier_description:** `String` — Description of the agent's purpose, shown to carriers for approval. See the [Carrier Description](/guides/campaigns/rcs-compliance#carrier-description) section for requirements.
    
</dd>
</dl>

<dl>
<dd>

**keywords:** `Pinnacle::Campaigns::Rcs::Types::RcsCampaignKeywords` 
    
</dd>
</dl>

<dl>
<dd>

**traffic:** `Pinnacle::Campaigns::Rcs::Types::RcsCampaignTraffic` 
    
</dd>
</dl>

<dl>
<dd>

**agent_triggers:** `String` — Explanation of how the agent is triggered. This includes how the first message is delivered, whether messages follow a schedule or triggered by user actions, and any external triggers. See the [Agent Triggers](/guides/campaigns/rcs-compliance#agent-triggers) section for requirements.
    
</dd>
</dl>

<dl>
<dd>

**interaction_description:** `String` — Description of all agent interactions, including primary and secondary use cases. See the [Interaction Description](/guides/campaigns/rcs-compliance#interaction-description) section for requirements.
    
</dd>
</dl>

<dl>
<dd>

**is_conversational:** `Internal::Types::Boolean` — Whether the agent supports conversational flows or respond to P2A messages from the users. Set to false for one-way messages from agent to user.
    
</dd>
</dl>

<dl>
<dd>

**cta_language:** `String` — Required text that appears next to the opt-in checkbox for your opt-in form. This checkbox has to be unchecked by default. See the [CTA Language](/guides/campaigns/rcs-compliance#cta-language-opt-in-disclosure) section for requirements.
    
</dd>
</dl>

<dl>
<dd>

**demo_trigger:** `String` — Instructions on how an external reviewer can trigger messages and an example flow from the agent. This is usually an inbound text message to the agent that will start a flow of messages between the agent and the user. See the [Demo Trigger](/guides/campaigns/rcs-compliance#demo-trigger) section for requirements.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Campaigns::Rcs::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.campaigns.rcs.<a href="/lib/pinnacle/campaigns/rcs/client.rb">validate</a>(request) -> Pinnacle::Types::CampaignValidationResult</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Validate your RCS campaign configuration against carrier requirements and compliance rules.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.campaigns.rcs.validate(
  additional_info: 'Please validate this DLC campaign for 10DLC compliance',
  campaign_id: 'dlc_1234567890'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Pinnacle::Types::ValidateCampaignParams` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Campaigns::Rcs::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Messages Sms
<details><summary><code>client.messages.sms.<a href="/lib/pinnacle/messages/sms/client.rb">send_</a>(request) -> Pinnacle::Messages::Sms::Types::SmsSendResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Send a SMS message immediately or schedule it for future delivery.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.messages.sms.send_(
  from: '+14155164736',
  text: 'Hey!',
  to: '+14154746461'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**from:** `String` — Phone number that sends the message in E.164 format.
    
</dd>
</dl>

<dl>
<dd>

**options:** `Pinnacle::Messages::Sms::Types::SendSmsOptions` — Additional settings to customize SMS delivery.
    
</dd>
</dl>

<dl>
<dd>

**text:** `String` — Message content.
    
</dd>
</dl>

<dl>
<dd>

**to:** `String` — Recipient's phone number in E.164 format.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Messages::Sms::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.sms.<a href="/lib/pinnacle/messages/sms/client.rb">validate</a>(request) -> Pinnacle::Types::SmsValidationResult</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Validate SMS message content without sending it.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.messages.sms.validate(text: 'Hello from Pinnacle');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Pinnacle::Types::SmsContent` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Messages::Sms::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Messages Mms
<details><summary><code>client.messages.mms.<a href="/lib/pinnacle/messages/mms/client.rb">send_</a>(request) -> Pinnacle::Messages::Mms::Types::MmsSendResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Send a MMS immediately or schedule it for future delivery.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.messages.mms.send_(
  from: '+14155164736',
  media_urls: ['https://fastly.picsum.photos/id/941/300/300.jpg?hmac=mDxM9PWSqRDjecwSCEpzU4bj35gqnG7yA25OL29uNv0'],
  options: {
    multiple_messages: true,
    validate: true
  },
  text: 'Check out this image!',
  to: '+14154746461'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**from:** `String` — Phone number you want to send the message from in E.164 format.
    
</dd>
</dl>

<dl>
<dd>

**media_urls:** `Internal::Types::Array[String]` 

Media file URLs to send.<br>

 See [supported media types](https://app.pinnacle.sh/supported-file-types?type=MMS).
    
</dd>
</dl>

<dl>
<dd>

**options:** `Pinnacle::Messages::Mms::Types::SendMmsOptions` — Control how your MMS is processed and delivered.
    
</dd>
</dl>

<dl>
<dd>

**text:** `String` — Message text to accompany the media.
    
</dd>
</dl>

<dl>
<dd>

**to:** `String` — Recipient's phone number in E.164 format.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Messages::Mms::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.mms.<a href="/lib/pinnacle/messages/mms/client.rb">validate</a>(request) -> Pinnacle::Types::MmsValidationResult</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Validate MMS message content without sending it.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.messages.mms.validate(
  media_urls: ['https://upload.wikimedia.org/wikipedia/commons/b/b9/Pizigani_1367_Chart_1MB.jpg', 'https://fastly.picsum.photos/id/528/1000/1000.jpg?hmac=aTG0xNif9KbNryFN0ZNZ_nFK6aEpZxqUGCZF1KjOT8w', 'https://file-examples.com/storage/fefdd7ab126835e7993bb1a/2017/10/file_example_JPG_500kB.jpg'],
  text: 'Check out these images!'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Pinnacle::Types::MmsContent` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Messages::Mms::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Messages Rcs
<details><summary><code>client.messages.rcs.<a href="/lib/pinnacle/messages/rcs/client.rb">send_</a>(request) -> Pinnacle::Messages::Rcs::Types::SendRichMessageResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Send a RCS message immediately or schedule it for future delivery. <br>

Requires an active RCS agent and recipient devices that support RCS Business Messaging.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.messages.rcs.send_(
  from: 'from',
  to: 'to',
  quick_replies: [],
  text: 'text'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Pinnacle::Types::RichMessage` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Messages::Rcs::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.rcs.<a href="/lib/pinnacle/messages/rcs/client.rb">send_typing</a>(request) -> Pinnacle::Types::SendTypingIndicatorResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Send a typing indicator from an RCS agent to a recipient.

This endpoint allows RCS agents to display a typing indicator to recipients. The indicator is a message bubble with animated typing dots like this: <img src="https://server.trypinnacle.app/storage/v1/object/public/pinnacle-public-assets/ios-typing-indicator.png" alt="Typing Indicator" style="display: inline; height: 1.5em; vertical-align: middle; margin: 0 4px;" />

**Use Case:** Typing indicators are especially useful for providing feedback to users while the agent is thinking or generating a response that may take some time, creating a more engaging conversational experience.

**Expiration:** Typing indicators automatically expire after around 20 seconds or when the agent sends a message, whichever comes first.

**Frequency:** You can send typing indicators as many times as needed, though only one will be displayed at a time. Sending multiple typing indicators will extend the duration of the current indicator.

> **Note:** Typing indicators are best-effort hints, not delivery-guaranteed state. The platform is allowed to coalesce or drop them, and the client UI decides when to show/hide.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.messages.rcs.send_typing(
  agent_id: 'agent_pinnacle',
  to: '+14154746461',
  options: {
    test_mode: false
  }
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**agent_id:** `String` 

The unique identifier of the RCS agent sending the typing indicator. <br>

Format: `agent_` followed by alphanumeric characters (e.g., `agent_pinnacle`).
    
</dd>
</dl>

<dl>
<dd>

**to:** `String` 

The recipient's phone number in E.164 format. <br>

Must include country code with a leading plus sign (e.g., `+14155551234`).
    
</dd>
</dl>

<dl>
<dd>

**options:** `Pinnacle::Messages::Rcs::Types::SendTypingIndicatorSchemaOptions` — Configure how your typing indicator is sent.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Messages::Rcs::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.rcs.<a href="/lib/pinnacle/messages/rcs/client.rb">validate</a>(request) -> Pinnacle::Types::RcsValidationResult</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Validate RCS message content without sending it.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.messages.rcs.validate(
  quick_replies: [],
  text: 'text'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Pinnacle::Types::RcsValidateContent` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Messages::Rcs::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Messages Blast
<details><summary><code>client.messages.blast.<a href="/lib/pinnacle/messages/blast/client.rb">sms</a>(request) -> Pinnacle::Messages::Blast::Types::BlastSmsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Send an SMS message to all contacts in an audience. <br>

Messages are distributed evenly across the provided sender phone numbers. <br>

Use the optional `schedule` parameter in `options` to schedule the blast for future delivery. When scheduled, the response will contain a `scheduleId` instead of blast details.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.messages.blast.sms(
  audience_id: 'aud_abc123',
  senders: ['+14155164736', '+14155164737'],
  message: {
    text: 'Hello from Pinnacle!'
  }
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**audience_id:** `String` 

The audience ID to send the blast to. This identifier is a string that always begins with the prefix `aud_`, for example: `aud_abc123`. <br>

You can create an audience via [the dashboard](https://app.pinnacle.sh/dashboard/audiences) or [API](/api-reference/audiences/create).
    
</dd>
</dl>

<dl>
<dd>

**senders:** `Internal::Types::Array[String]` 

Array of phone numbers to send from in E.164 format. <br>

Messages will be distributed evenly across these senders.

> **Note:** Sandbox numbers cannot be used for blasts.

**Limit:** 1 min
    
</dd>
</dl>

<dl>
<dd>

**message:** `Pinnacle::Types::SmsContent` 
    
</dd>
</dl>

<dl>
<dd>

**options:** `Pinnacle::Messages::Blast::Types::BlastSmsOptions` — Additional settings to customize SMS blast delivery.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Messages::Blast::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.blast.<a href="/lib/pinnacle/messages/blast/client.rb">mms</a>(request) -> Pinnacle::Messages::Blast::Types::BlastMmsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Send an MMS message to all contacts in an audience. <br>

Messages are distributed evenly across the provided sender phone numbers. <br>

Use the optional `schedule` parameter in `options` to schedule the blast for future delivery. When scheduled, the response will contain a `scheduleId` instead of blast details.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.messages.blast.mms(
  audience_id: 'aud_abc123',
  senders: ['+14155164736', '+14155164737'],
  message: {
    media_urls: ['https://fastly.picsum.photos/id/941/300/300.jpg'],
    text: 'Check out this image!'
  },
  options: {
    validate: true
  }
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**audience_id:** `String` 

The audience ID to send the blast to. This identifier is a string that always begins with the prefix `aud_`, for example: `aud_abc123`. <br>

You can create an audience via [the dashboard](https://app.pinnacle.sh/dashboard/audiences) or [API](/api-reference/audiences/create).
    
</dd>
</dl>

<dl>
<dd>

**senders:** `Internal::Types::Array[String]` 

Array of phone numbers to send from in E.164 format. <br>

Messages will be distributed evenly across these senders.

> **Note:** Sandbox numbers cannot be used for blasts.

**Limit:** 1 min
    
</dd>
</dl>

<dl>
<dd>

**message:** `Pinnacle::Types::MmsContent` 
    
</dd>
</dl>

<dl>
<dd>

**options:** `Pinnacle::Messages::Blast::Types::BlastMmsOptions` — Additional settings to customize MMS blast delivery.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Messages::Blast::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.blast.<a href="/lib/pinnacle/messages/blast/client.rb">rcs</a>(request) -> Pinnacle::Messages::Blast::Types::BlastRcsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Send an RCS message to all contacts in an audience. <br>

Messages are distributed evenly across the provided RCS agents for load balancing. Requires active RCS agents and recipient devices that support RCS Business Messaging. <br>

Use the optional `schedule` parameter in `options` to schedule the blast for future delivery. When scheduled, the response will contain a `scheduleId` instead of blast details.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.messages.blast.rcs(
  audience_id: 'aud_abc123',
  senders: ['agent_pinnacle', 'agent_pinnacle2'],
  message: {
    quick_replies: [],
    text: 'Hello from Pinnacle RCS!'
  },
  options: {
    transcode: true,
    validate: true
  }
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**audience_id:** `String` 

The audience ID to send the blast to. This identifier is a string that always begins with the prefix `aud_`, for example: `aud_abc123`. <br>

You can create an audience via [the dashboard](https://app.pinnacle.sh/dashboard/audiences) or [API](/api-reference/audiences/create).
    
</dd>
</dl>

<dl>
<dd>

**senders:** `Internal::Types::Array[String]` 

Array of RCS agent IDs to send from. Each must be prefixed with `agent_`. <br>

Messages will be evenly distributed across these agents.

> **Note:** Test agents cannot be used for blasts.

**Limit:** 1 min
    
</dd>
</dl>

<dl>
<dd>

**message:** `Pinnacle::Types::RcsValidateContent` 
    
</dd>
</dl>

<dl>
<dd>

**options:** `Pinnacle::Messages::Blast::Types::BlastRcsOptions` — Configure how your RCS blast is sent and tracked.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Messages::Blast::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Messages Schedule
<details><summary><code>client.messages.schedule.<a href="/lib/pinnacle/messages/schedule/client.rb">cancel</a>(id) -> Pinnacle::Types::ScheduleCancelResult</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Cancel a scheduled message or blast. <br>

Works for both individual scheduled messages and scheduled blasts. Use the `scheduleId` returned when the message or blast was scheduled.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.messages.schedule.cancel(id: 'id');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Unique identifier of the scheduled message. This identifier is a string that always begins with the prefix `msg_sched_`, for example: `msg_sched_1234567890`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Messages::Schedule::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## PhoneNumbers Webhook
<details><summary><code>client.phone_numbers.webhook.<a href="/lib/pinnacle/phone_numbers/webhook/client.rb">attach</a>(phone, request) -> Pinnacle::Types::ConfiguredWebhook</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Connect a webhook to your phone number to receive real-time notifications for incoming messages, delivery status updates, and other communication events.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.phone_numbers.webhook.attach(
  phone: '%2B14155551234',
  webhook_id: 'wh_1234567890',
  event: 'MESSAGE.STATUS'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**phone:** `String` 

The phone number you want to attach the webhook to in E.164 format. Make sure it is url encoded (i.e. replace the leading + with %2B). <br>

Must be a phone number that you own and have already [purchased](./buy) through the API. A phone number can have multiple webhooks attached to it.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Pinnacle::Types::AttachWebhookParams` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::PhoneNumbers::Webhook::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.phone_numbers.webhook.<a href="/lib/pinnacle/phone_numbers/webhook/client.rb">detach</a>(phone, webhook_id) -> Pinnacle::Types::DetachedWebhookInfo</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Disconnect a webhook from your phone number to stop receiving event notifications for that specific number. <br>

The webhook configuration itself remains intact and available for use with other phone numbers.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.phone_numbers.webhook.detach(
  phone: '+14155551234',
  webhook_id: 'wh_1234567890'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**phone:** `String` 

The phone number you want to attach the webhook to in E.164 format. Make sure it is url encoded (i.e. replace the leading + with %2B). <br>

Must be a phone number that you own and currently has the specified webhook attached.
    
</dd>
</dl>

<dl>
<dd>

**webhook_id:** `String` 

The unique identifier of the webhook you want to detach from the phone number. <br>

This must be a valid webhook ID that is currently attached to the specified phone number. This identifier is a string that always begins with the prefix `wh_`, for example: `wh_1234567890`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::PhoneNumbers::Webhook::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## PhoneNumbers Campaign
<details><summary><code>client.phone_numbers.campaign.<a href="/lib/pinnacle/phone_numbers/campaign/client.rb">attach</a>(request) -> Pinnacle::Types::AttachedPhoneNumberResult</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Link a phone number to a specific campaign. Phone numbers must be linked to a campaign to send messages.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.phone_numbers.campaign.attach(
  phones: ['+14155550123', '+14155559876', '+14155550111'],
  campaign_type: 'TOLL_FREE',
  campaign_id: 'tf_1234567890'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**phones:** `Internal::Types::Array[String]` 

List of phone number (E.164 format). <br><br>
**Limit:** 1 to 10
    
</dd>
</dl>

<dl>
<dd>

**campaign_type:** `Pinnacle::Types::MessagingProfileEnum` 
    
</dd>
</dl>

<dl>
<dd>

**campaign_id:** `String` 

Unique identifier for the campaign. <br>

 - **TOLL_FREE** campaigns:
   - Must begin with the prefix `tf_`
   - Example: `tf_1234567890`
 - **10DLC** campaigns:
   - Must begin with the prefix `dlc_`
   - Example: `dlc_1234567890`
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::PhoneNumbers::Campaign::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.phone_numbers.campaign.<a href="/lib/pinnacle/phone_numbers/campaign/client.rb">detach</a>(request) -> Pinnacle::Types::DetachedPhoneNumberResult</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Remove the association between a phone number and its attached campaign.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.phone_numbers.campaign.detach(phones: ['+14155559876', '14155550111']);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**phones:** `Internal::Types::Array[String]` 

List of phone numbers (E.164 format). <br><br>
**Limit:** 1 to 10
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::PhoneNumbers::Campaign::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Status Get
<details><summary><code>client.status.get.<a href="/lib/pinnacle/status/get/client.rb">brand</a>(brand_id) -> Pinnacle::Types::BrandStatus</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a brand's status.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.status.get.brand(brand_id: 'b_1234567890');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**brand_id:** `String` — The unique identifier of the brand you want to retrieve the status for. This identifier is a string that always begins with the prefix `b_`, for example: `b_1234567890`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Status::Get::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.status.get.<a href="/lib/pinnacle/status/get/client.rb">toll_free</a>(campaign_id) -> Pinnacle::Types::TollFreeCampaignStatus</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a toll-free campaign's status.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.status.get.toll_free(campaign_id: 'tf_1234567890');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**campaign_id:** `String` — The unique identifier of the toll-free campaign you want to retrieve the status for. This identifier is a string that always begins with the prefix `tf_`, for example: `tf_1234567890`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Status::Get::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.status.get.<a href="/lib/pinnacle/status/get/client.rb">dlc</a>(campaign_id) -> Pinnacle::Types::DlcCampaignStatus</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a 10DLC campaign's status.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.status.get.dlc(campaign_id: 'dlc_1234567890');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**campaign_id:** `String` — The unique identifier of the 10DLC campaign you want to retrieve the status for. This identifier is a string that always begins with the prefix `dlc_`, for example: `dlc_1234567890`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Status::Get::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.status.get.<a href="/lib/pinnacle/status/get/client.rb">rcs</a>(campaign_id) -> Pinnacle::Types::RcsCampaignStatus</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a RCS campaign's status.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.status.get.rcs(campaign_id: 'rcs_1234567890');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**campaign_id:** `String` — The unique identifier of the RCS campaign you want to retrieve the status for. This identifier is a string that always begins with the prefix `rcs_`, for example: `rcs_1234567890`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Status::Get::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.status.get.<a href="/lib/pinnacle/status/get/client.rb">phone_number</a>(phone_number) -> Pinnacle::Types::PhoneNumberStatus</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a phone number's order status and campaign attachment status. <br>

Check if a number is active and ready to send messages.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.status.get.phone_number(phone_number: '+14151234567');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**phone_number:** `String` — Phone number in E164 format that is in review.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Status::Get::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Tools Url
<details><summary><code>client.tools.url.<a href="/lib/pinnacle/tools/url/client.rb">create</a>(request) -> Pinnacle::Types::ShortenedUrl</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a shortened URL that redirects visitors to the provided destination URL.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.tools.url.create(
  url: 'https://www.pinnacle.sh/',
  options: {
    expires_at: '2025-06-23T16:18:25.000Z'
  }
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**url:** `String` — Destination URL for the shortened link that visitors will be redirected to when clicked.
    
</dd>
</dl>

<dl>
<dd>

**options:** `Pinnacle::Types::CreateUrlOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Tools::Url::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.tools.url.<a href="/lib/pinnacle/tools/url/client.rb">get</a>(link_id) -> Pinnacle::Types::ShortenedUrlWithClickData</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve configuration and details for your shortened URL using its unique identifier.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.tools.url.get(link_id: 'ePzVxILF');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**link_id:** `String` 

Unique identifier from your shortened URL. For example, for `https://pncl.to/ePzVxILF`, the `linkId` is `ePzVxILF`. <br>

See the response of [Create Shortened URL](./create-url) for more information.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Tools::Url::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.tools.url.<a href="/lib/pinnacle/tools/url/client.rb">update</a>(link_id, request) -> Pinnacle::Types::ShortenedUrl</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update the destination or expiration date of an existing shortened URL. Expiring links cannot be updated into a permalink.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.tools.url.update(
  link_id: 'ePzVxILF',
  url: 'https://www.pinnacle.sh/'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**link_id:** `String` 

Unique identifier from your shortened URL. For example, for `https://pncl.to/ePzVxILF`, the `linkId` is `ePzVxILF`. <br>

See the response of [Create Shortened URL](./create-url) for more information.
    
</dd>
</dl>

<dl>
<dd>

**url:** `String` — New destination URL where your visitors will be redirected.
    
</dd>
</dl>

<dl>
<dd>

**options:** `Pinnacle::Types::CreateUrlOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Tools::Url::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Tools File
<details><summary><code>client.tools.file.<a href="/lib/pinnacle/tools/file/client.rb">upload</a>(request) -> Pinnacle::Types::UploadResults</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Generate presigned URLs that let you upload files directly to our storage and allow your users to download them securely.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.tools.file.upload(
  content_type: 'image/jpeg',
  size: 1024,
  name: 'test.jpg',
  options: {
    delete_at: '2025-12-31T23:59:59Z',
    download: {
      expires_at: '2025-06-30T12:00:00.000Z'
    }
  }
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**content_type:** `String` 

MIME type of your file. <br>

Supported file types:
- Audio: mp3, mp4, mpeg, ogg, aac, webm, wav, 3gpp, amr
- Video: mp4, mpeg, quicktime, webm, 3gpp, H.264, m4v
- Image: jpeg, png, gif, bmp, tiff, webp
- Documents: pdf, csv, rtf, calendar, vcard
    
</dd>
</dl>

<dl>
<dd>

**size:** `Integer` — Size of your file in bytes. Should be less than 100 MB.
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` — Name of your file.
    
</dd>
</dl>

<dl>
<dd>

**options:** `Pinnacle::Tools::File::Types::UploadFileOptions` — Additional configurations for your file.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Tools::File::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.tools.file.<a href="/lib/pinnacle/tools/file/client.rb">refresh</a>(request) -> Internal::Types::Array[Pinnacle::Types::RefreshedFile]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Refresh expiring presigned URLs for Pinnacle-hosted files to extend their access time.

<Callout type="info">
  This only works for presigned download URLs. At this moment, you cannot refresh a presigned upload URL, generate a new one instead.
</Callout>
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.tools.file.refresh(urls: ['https://server.trypinnacle.app/storage/v1/object/sign/vault/3/test.jpg?token=oldtoken', 'https://server.trypinnacle.app/storage/v1/object/sign/vault/3/document.pdf?token=oldtoken2', 'invalid/url', 'https://google.com']);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**urls:** `Internal::Types::Array[String]` — Array of file URLs to refresh for extended access. Provided URLs must be presigned URLs (i.e. `https://server.trypinnacle.app/storage/v1/object/sign/...`). Invalid or external URLs will be returned unchanged in the response.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Tools::File::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Tools ContactCard
<details><summary><code>client.tools.contact_card.<a href="/lib/pinnacle/tools/contact_card/client.rb">get</a>(request) -> Pinnacle::Types::VCardData</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve contact information as a vCard and get a presigned URL to download the file. Contact cards can be sent [via MMS](/api-reference/messages/send-mms) as a media file.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.tools.contact_card.get(id: 'cc_1234567890');
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the contact. This identifier is a string that always begins with the prefix `cc_`, for example: `cc_1234567890`.
    
</dd>
</dl>

<dl>
<dd>

**options:** `Pinnacle::Tools::ContactCard::Types::GetVCardSchemaOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Tools::ContactCard::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.tools.contact_card.<a href="/lib/pinnacle/tools/contact_card/client.rb">upsert</a>(request) -> Pinnacle::Types::VcardResource</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new contact card or updates an existing one with full vCard data. Contact cards can be sent [via MMS](/api-reference/messages/send-mms) as a media file.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.tools.contact_card.upsert(
  id: 'cc_1234567890',
  formatted_name: 'Jane Smith',
  name: {
    family_name: 'Smith',
    given_name: 'Jane',
    additional_names: ['A.'],
    honorific_prefixes: ['Dr.'],
    honorific_suffixes: ['PhD']
  },
  nickname: ['Janie'],
  birthday: '1990-02-15',
  addresses: [{
    country_name: 'USA',
    extended_address: 'Apt. 4B',
    locality: 'Anytown',
    postal_code: '90210',
    post_office_box: 'PO Box 123',
    region: 'CA',
    street_address: '123 Main St',
    type: ['HOME', 'PREF']
  }],
  url: 'https://app.pinnacle.sh',
  phones: [{
    type: ['CELL'],
    value: '+15551234567'
  }],
  emails: [{
    type: ['INTERNET'],
    value: 'jane.smith@example.com'
  }],
  timezone: 'America/Los_Angeles',
  geo: {
    latitude: 34.0522,
    longitude: -118.2437
  },
  title: 'Engineer',
  role: 'Developer',
  organization: {
    name: 'Acme Co',
    units: ['Engineering', 'R&D']
  },
  categories: ['Friend', 'Colleague'],
  note: 'Test contact entry',
  photo: 'https://fastly.picsum.photos/id/853/200/200.jpg?hmac=f4LF-tVBBnJb9PQAVEO8GCTGWgLUnxQLw44rUofE6mQ'
);
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**photo:** `String` — Contact's photo
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Pinnacle::Tools::ContactCard::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>
